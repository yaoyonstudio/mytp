<?php
namespace app\admin\validate;

use think\Validate;

class NewscateValid extends Validate
{
  //错误提示
  public function __construct(){
    $this->message=[
      'cat_name'  =>  '类型名为必填',
      'parent_id' =>  '父级类别为数字'
    ];
  }

  protected $rule = [
    'cat_name'  =>  'require',
    'parent_id' => 'number'
  ];
}