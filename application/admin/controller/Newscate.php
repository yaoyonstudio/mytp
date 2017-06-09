<?php
namespace app\admin\controller;
use app\admin\model\NewsCate as NewsCateModel;

use think\Controller;

class NewsCate extends Controller
{
    public function index()
    {
        $name = "资讯分类管理";
        $desc = "资讯分类";
        $this->assign("name", $name);
        $this->assign("desc", $desc);
        return $this->fetch();
    }

    public function getNewsCateList()
    {
        $data = [];
        $all_cate = NewsCateModel::all(function($query){
            $start = input('start');
            $page_size = input('length') ? input('length') : 10;

            // 排序
            $order = input('order/a');
            $columns = input('columns/a');
            $order_field = $columns[$order[0]['column']]['data'];
            $order_type = $order[0]['dir'];

            // 搜索
            $search = input('search/a');

            $query->limit($start, $page_size)
                ->where('cat_name', 'like', '%'.$search['value'].'%')
                ->order($order_field, $order_type);
        });

        $count = NewsCateModel::count();

        $data['draw'] = input('draw') + 1;
        $data['recordsTotal'] = $count;
        $data['recordsFiltered'] = $count;
        $data['data'] = $all_cate;

        echo json_encode($data);
    }

    public function add()
    {
        $name = "添加资讯分类";
        $desc = "";
        $all_cate = NewsCateModel::all();

        $this->assign("name", $name);
        $this->assign("desc", $desc);
        $this->assign("all_cate", $all_cate);

        return $this->fetch();
    }

    public function create()
    {
        $cate = new NewsCateModel;
        $cate->cat_name = input('cat_name');
        $cate->parent_id = input('parent_id');

        $cate->save();
        if ($cate->cat_id) {
            echo '<script>alert("类别插入成功！");location.href="/admin/NewsCate/index"</script>';
        } else {
            echo '<script>alert("类别添加失败！");</script>';
        }
    }

    public function edit()
    {
        $name = "添加资讯分类";
        $desc = "";
        $all_cate = NewsCateModel::all();

        $id = input('id');
        $data = NewsCateModel::get($id);

        $this->assign("name", $name);
        $this->assign("desc", $desc);
        $this->assign("cateData", $data);
        $this->assign("all_cate", $all_cate);

        return $this->fetch();
    }

    public function update()
    {
        $cat_id = input('cat_id');
        $cat_name = input('cat_name');
        $parent_id = input('parent_id');
        $result = NewsCateModel::where('cat_id', $cat_id)->update(['cat_name' => $cat_name, 'parent_id' => $parent_id]);
        if ($result) {
            echo '<script>alert("类别更新成功！");location.href="/admin/NewsCate/index"</script>';
        } else {
            echo '<script>alert("类别更新失败！");location.href="/admin/NewsCate/index"</script>';
        }
    }
}
