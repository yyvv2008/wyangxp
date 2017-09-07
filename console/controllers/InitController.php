<?php

namespace console\controllers;

use common\models\User;

/**
 * summary
 */
class InitController extends \yii\console\Controller
{
    /**
     * summary
     */
    public function actionIndex()
    {
    	$model = new User();
    	$model->username = 'wyang';
    	$model->email = '591012658@qq.com';
    	$model->setPassword('111111');
    	$model->generateAuthKey();

    	if ($model->save()) {
    		echo 'wyang/111111';
    	} else {
    		echo 'failed';
    	}
    }
}