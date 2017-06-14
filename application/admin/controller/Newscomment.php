<?php
namespace app\admin\controller;
use app\admin\model\NewsComment as NewsCommentModel;

use think\Db;
use think\Controller;
use think\Loader;

class NewsComment extends Controller
{
    public function index()
    {
        $name = "资讯评论管理";
        $desc = "资讯评论";
        $this->assign("name", $name);
        $this->assign("desc", $desc);
        return $this->fetch();
    }

    public function getNewsCommentList()
    {
        $data = [];
        $all_comment = NewsCommentModel::all(function($query){
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
                ->where('comment_content', 'like', '%'.$search['value'].'%')
                ->order($order_field, $order_type);
        });

        $count = NewsCommentModel::count();

        $data['draw'] = input('draw') + 1;
        $data['recordsTotal'] = $count;
        $data['recordsFiltered'] = $count;
        $data['data'] = $all_comment;

        echo json_encode($data);
    }

    public function modify_show()
    {
        $comment_id = input('comment_id');
        $is_show = input('is_show');

        if (!$comment_id || !isset($is_show)) {
            return falseReturn(null, '缺少必要参数');
        } else {
            if ($is_show == 1) {
                $comment_is_show = 0;
            } else {
                $comment_is_show = 1;
            }
            $result = NewsCommentModel::where('comment_id', $comment_id)->update(['comment_is_show' => $comment_is_show]);
            if ($result) {
                return trueReturn($result);
            } else {
                return falseReturn(null);
            }
        }
    }

    public function delete()
    {
        $comment_id = input('post.id');
        $result = NewsCommentModel::destroy($comment_id);
        if ($result) {
            return trueReturn($result);
        } else {
            return falseReturn(null);
        }
    }

//////////////////////////////////////

    public function create()
    {
        $data = [
          'news_id' => input('news_id'),
          'user_id' => input('user_id'),
          'comment_content' => input('comment_content'),
          'create_time' => time(),
          'update_time' => time()
        ];

        $validate = Loader::validate('app\admin\validate\NewsCommentValid');

        if($validate->check($data)){
//            dump($data);die;
          Db::name('news_comment')->insert($data);
          $comment_id = Db::name('news_comment')->getLastInsID();
          if ($comment_id) {
            return trueReturn($comment_id);
          } else {
            return falseReturn(null);
          }
        } else {
            return falseReturn(null, $validate->getError());
        }
    }
}
