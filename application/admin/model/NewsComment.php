<?php
namespace app\admin\model;

use think\Model;

class NewsComment extends Model{
    protected $autoWriteTimestamp = true;

    protected $insert = ['comment_is_show', 'comment_good_count', 'comment_bad_count'];

    protected function setCommentIsShowAttr() {
        return 0;
    }
    protected function setCommentGoodCountAttr() {
        return 0;
    }
    protected function setCommentBadCountAttr() {
        return 0;
    }

    protected $field = [
        'comment_id'          => 'int',
        'news_id'      => 'int',
        'user_id'      => 'int',
        'comment_is_show'      => 'int',
        'comment_good_count'      => 'int',
        'comment_bad_count'      => 'int',
        'create_time'      => 'int',
        'update_time'      => 'int',
        'comment_content'
    ];

    public function user(){
        return $this->hasOne('User',"user_id","user_id")->field('user_id,user_name,user_headpic,user_nickname');
    }
}