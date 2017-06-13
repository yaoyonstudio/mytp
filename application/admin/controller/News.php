<?php
namespace app\admin\controller;

use app\admin\model\News as NewsModel;
use app\admin\model\NewsCate as NewsCateModel;
use app\admin\model\NewsImage as NewsImageModel;

use think\Db;
use think\Controller;
use think\Loader;

class News extends Controller
{
    public function index()
    {
        $name = "资讯管理";
        $desc = "资讯";
        $this->assign("name", $name);
        $this->assign("desc", $desc);
        return $this->fetch();
    }

    public function getNewsList()
    {
        $data = [];
        $all_news = NewsModel::all(function($query){
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
                ->where('news_title', 'like', '%'.$search['value'].'%')
                ->order($order_field, $order_type);
        });

        // 关闭查询
        foreach($all_news as $news) {
            $rst = $news->cate;
            $news['cat_name'] = $rst['cat_name'];
        }

        $count = NewsModel::count();

        $data['draw'] = input('draw') + 1;
        $data['recordsTotal'] = $count;
        $data['recordsFiltered'] = $count;
        $data['data'] = $all_news;

        echo json_encode($data);
    }

    public function modify_recommend()
    {
        $news_id = input('news_id');
        $isrecommend = input('isrecommend');

        if (!$news_id || !isset($isrecommend)) {
            return falseReturn(null, '缺少必要参数');
        } else {
            if ($isrecommend == 1) {
                $news_isrecommend = 0;
            } else {
                $news_isrecommend = 1;
            }
            $result = NewsModel::where('news_id', $news_id)->update(['news_isrecommend' => $news_isrecommend]);
            if ($result) {
                return trueReturn($result);
            } else {
                return falseReturn(null);
            }
        }
    }

    public function add()
    {
        $name = "添加资讯";
        $desc = "";

        $all_cate = NewsCateModel::all();

        $this->assign("name", $name);
        $this->assign("desc", $desc);
        $this->assign("all_cate", $all_cate);

        return $this->fetch();
    }

    public function create()
    {
        $data = $_POST;

        if ($data['news_img']) {
            $full_filename = saveBase64ImagePng($data['news_img'], 'upload/');
            if (isset($full_filename)) {
                Db::name('news_image')->insert([
                    'img_originUrl' => $full_filename,
                    'create_time'       =>  time(),
                    'update_time'       =>  time()
                ]);
                $news_image_id = Db::name('news_image')->getLastInsID();
            }
        }

        $insertData = [
            'user_id'           =>  1,
            'cat_id'           =>  $data['cat_id'],
            'news_title'        =>  $data['news_title'],
            'news_description'        =>  isset($data['news_description']) ? $data['news_description'] : null,
            'news_keywords'        =>  isset($data['news_keywords']) ? $data['news_keywords'] : null,
            'news_content'        =>  $data['news_content'],
            'news_source'        =>  isset($data['news_source']) ? $data['news_source'] : null,
            'news_source_link'        =>  isset($data['news_source_link']) ? $data['news_source_link'] : null,
            'news_isopen'        =>  isset($data['news_isopen']) ? $data['news_isopen'] : 0,
            'news_isrecommend'        =>  isset($data['news_isrecommend']) ? $data['news_isrecommend'] : 0,
            'news_file_url'        =>  isset($data['news_file_url']) ? $data['news_file_url'] : null,
            'img_id'           => isset($news_image_id) ? $news_image_id : null,
            'create_time'       =>  time(),
            'update_time'       =>  time()
        ];

        $validate = Loader::validate('app\admin\validate\NewsValid');

        if($validate->check($insertData)){
            Db::name('news')->insert($insertData);
            $news_id = Db::name('news')->getLastInsID();
            if ($news_id) {
                return trueReturn($news_id);
            } else {
                return falseReturn(null);
            }
        } else {
            return falseReturn(null, $validate->getError());
        }
    }

    public function edit()
    {
        $name = "修改资讯";
        $desc = "";
        $all_cate = NewsCateModel::all();

        $news_id = input('id');
        $data = NewsModel::get($news_id);

//        dump($data);die;
        $data->img;


        $this->assign("name", $name);
        $this->assign("desc", $desc);
        $this->assign("newsData", $data);
        $this->assign("all_cate", $all_cate);

//        dump($data);die;

        return $this->fetch();
    }

    public function update()
    {
        $data = $_POST;
        $news_id = $data['news_id'];
        if (!$news_id) {
            return falseReturn(null, '新闻ID不能为空');
        }

        $validate = Loader::validate('app\admin\validate\NewsValid');

        $updateData = [
            'user_id'           =>  1,
            'cat_id'           =>  $data['cat_id'],
            'news_title'        =>  $data['news_title'],
            'news_description'        =>  isset($data['news_description']) ? $data['news_description'] : null,
            'news_keywords'        =>  isset($data['news_keywords']) ? $data['news_keywords'] : null,
            'news_content'        =>  $data['news_content'],
            'news_source'        =>  isset($data['news_source']) ? $data['news_source'] : null,
            'news_source_link'        =>  isset($data['news_source_link']) ? $data['news_source_link'] : null,
            'news_isopen'        =>  isset($data['news_isopen']) ? $data['news_isopen'] : 0,
            'news_isrecommend'        =>  isset($data['news_isrecommend']) ? $data['news_isrecommend'] : 0,
            'news_file_url'        =>  isset($data['news_file_url']) ? $data['news_file_url'] : null,
            'create_time'       =>  time(),
            'update_time'       =>  time()
        ];

        // 查看图片是否更换
        if ($data['img_id']) {
            // 没有更改图片
        } else {
            if ($data['news_img']) {
                $full_filename = saveBase64ImagePng($data['news_img'], 'upload/');
                if (isset($full_filename)) {
                    Db::name('news_image')->insert([
                        'img_originUrl' => $full_filename,
                        'create_time'       =>  time(),
                        'update_time'       =>  time()
                    ]);
                    $news_image_id = Db::name('news_image')->getLastInsID();
                }
            }
            if (isset($news_image_id)) {
                $updateData['img_id'] = $news_image_id;
            }
        }

        if($validate->check($updateData)){
            $result = NewsModel::where('news_id', $news_id)->update($updateData);
            if ($result) {
                return trueReturn($news_id);
            } else {
                return falseReturn(null);
            }
        } else {
            return falseReturn(null, $validate->getError());
        }
    }

    public function delete()
    {
        $news_id = input('post.id');
        $result = NewsModel::destroy($news_id);
        if ($result) {
            return trueReturn($result);
        } else {
            return falseReturn(null);
        }
    }
}
