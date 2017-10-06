<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],

                
        'urlManager' => [
            // 'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
        //         '<controller:\w+>/<id:\d+>' => '<controller>/<action>',
        //         '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
        //         '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
        //         '<module:\w+>/<controller:\w+>/<action:\w+>/<id:\d+>' => '<module>/<controller>/<action>',
            ],
        ],
    ],
    'language' => 'zh-CN',
    'timeZone' => 'Asia/Shanghai',
];
