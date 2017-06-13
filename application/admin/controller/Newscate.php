<?php
namespace app\admin\controller;
use app\admin\model\NewsCate as NewsCateModel;

use think\Db;
use think\Controller;
use think\Loader;

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
        $data = [
          'cat_name' => input('cat_name'),
          'parent_id' => intval(input('parent_id')),
          'create_time' => time(),
          'update_time' => time()
        ];

        $validate = Loader::validate('app\admin\validate\NewscateValid');

        if($validate->check($data)){
          Db::name('news_cate')->insert($data);
          $cat_id = Db::name('news_cate')->getLastInsID();
          if ($cat_id) {
            return trueReturn($cat_id);
          } else {
            return falseReturn(null);
          }
        } else {
            return falseReturn(null, $validate->getError());
        }
    }

    public function edit()
    {
        $name = "修改资讯分类";
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
        $data = $_POST;
        $cat_id = $data['cat_id'];
        $cat_name = $data['cat_name'];
        $parent_id = $data['parent_id'];
        $result = NewsCateModel::where('cat_id', $cat_id)->update(['cat_name' => $cat_name, 'parent_id' => $parent_id]);
        if ($result) {
            return trueReturn($result);
        } else {
            return falseReturn(null);
        }
    }

    public function delete()
    {
        $cat_id = input('post.id');
        $result = NewsCateModel::destroy($cat_id);
        if ($result) {
            return trueReturn($result);
        } else {
            return falseReturn(null);
        }
    }
}
