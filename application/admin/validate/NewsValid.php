<?php
namespace app\common\validate;

use think\Validate;

class NewsValid extends Validate
{
    //错误提示
    public function __construct(){
        $this->message=[
            'cat_id'        =>      '类型为必填，且必须为数字',
            'user_id'       =>      '作者为必填，且必须为数字',
            'news_isopen'   =>      '新闻开启状态为必填，且只能是1或0',
            'news_title'    =>      '新闻标题必填',
            'news_content'  =>      '新闻内容必填'
        ];
    }
    // 验证规则
    protected $rule = [
        'cat_id'        =>      'require|number',
        'user_id'       =>      'require|number',
        'news_isopen'   =>      'require|number',
        'news_title'    =>      'require',
        'news_content'  =>      'require',
    ];

}