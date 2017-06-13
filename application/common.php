<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function trueReturn ($data, $msg="请求成功") {
    $result = [];
    $result['data'] = $data;
    $result['status'] = 1;
    $result['msg'] = $msg;
    echo json_encode($result);
}

function falseReturn ($data, $msg="请求失败") {
    $result = [];
    $result['data'] = $data;
    $result['status'] = 0;
    $result['msg'] = $msg;
    echo json_encode($result);
}

/**
 * 生成随机文件名函数
 * @param 文件名长度
 * @param 文件名
 */
function random($length)
{
    $hash = 'CR-';
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    $max = strlen($chars) - 1;
    mt_srand((double)microtime() * 1000000);
    for ($i = 0; $i < $length; $i++) {
        $hash .= $chars[mt_rand(0, $max)];
    }
    return $hash;
}

// 检查base64是否是图片
function check_base64_image($base64) {
    $img = imagecreatefromstring(base64_decode($base64));
    if (!$img) {
        return false;
    }

    imagepng($img, 'tmp.png');
    $info = getimagesize('tmp.png');

    unlink('tmp.png');

    if ($info[0] > 0 && $info[1] > 0 && $info['mime']) {
        return true;
    }

    return false;
}

// 保存base64图片
function saveBase64ImagePng($base64Image, $imageDir)
{
    $base64Image = trim($base64Image);
    $base64Image = str_replace('data:image/png;base64,', '', $base64Image);
    $base64Image = str_replace('data:image/jpg;base64,', '', $base64Image);
    $base64Image = str_replace('data:image/jpeg;base64,', '', $base64Image);
    $base64Image = str_replace('data:image/gif;base64,', '', $base64Image);
    $base64Image = str_replace(' ', '+', $base64Image);

    if (!check_base64_image($base64Image)) {
        return false;
    } else {
        $path = 'upload/' . date('Ymd') ;
        $fileName =  date('Ymd') . '/' . random(10) . '.png';

        if(!is_dir($path)) {
            mkdir($path);
        }

        $imageData = base64_decode($base64Image);
        //Set image whole path here
        $filePath = $imageDir . $fileName;

        file_put_contents($filePath, $imageData);

        return 'upload/' . $fileName;
    }
}