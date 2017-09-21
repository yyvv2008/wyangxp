<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/font-awesome.min.css',
        'js/laydate/need/laydate.css',
        'css/sweetalert.css',
    ];

    public $js = [
        'js/jquery.pjax.js',
        'js/site.js',
        'js/laydate/laydate.js',
        'js/bootstrap-prettyfile.js',
        'js/sweetalert.min.js',
    ];
    
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
