<?php
namespace app\admin\model;

use think\Model;

class NewsCate extends Model{
    protected $autoWriteTimestamp = true;

    protected $field = [
        'cat_id'          => 'int',
        'parent_id'      => 'int',
        'create_time'      => 'int',
        'update_time'      => 'int',
        'cat_name'
    ];

    // public function getCateName(){
    //     return $this->cat_name;
    // }
}