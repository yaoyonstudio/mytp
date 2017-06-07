<?php
namespace app\admin\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        $name = "我的网站";
        $this->assign("name", $name);
        return $this->fetch();
    }
}
