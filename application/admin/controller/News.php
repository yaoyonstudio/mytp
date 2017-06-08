<?php
namespace app\admin\controller;

use think\Controller;

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

    public function add()
    {
        $name = "添加资讯";
        $desc = "";
        $this->assign("name", $name);
        $this->assign("desc", $desc);
        return $this->fetch();
    }

    public function createNews()
    {
        dump($_POST);
    }
}
