<?php
namespace app\common\validate;

use think\Validate;

class NewsCommentValid extends Validate
{
    //错误提示
    public function __construct(){
        $this->message=[
            'user_id'           =>      '用户ID为必填，且必须为数字',
            'news_id'           =>      '资讯ID为必填，且必须为数字',
            'comment_content'   =>      '新闻内容必填'
        ];
    }
    // 验证规则
    protected $rule = [
        'user_id'        =>      'require|number|min:1',
        'news_id'       =>      'require|number',
        'comment_content'   =>      'require',
    ];

}