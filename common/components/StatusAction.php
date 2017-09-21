<?php

namespace common\components;

use yii;
use yii\helpers\Url;
use yii\web\Response;
use yii\web\BadRequestHttpException;

class StatusAction extends \yii\base\Action
{

    public $modelClass;

    public function run($id = 0, $field = 'status', $val = 0)
    {
        yii::$app->getResponse()->format = Response::FORMAT_JSON;

        $model = call_user_func([$this->modelClass, 'findOne'], $id);
        if (! $model) {
            throw new BadRequestHttpException(yii::t("app", "Cannot find model by $id"));
        }

        $model->$field = $val;

        if ($model->save(false)) {
            return ['code' => 0, 'message' => yii::t('app', 'Success')];
        } else {
            $errors = $model->getErrors();
            $err = '';
            foreach ($errors as $v) {
                $err .= $v[0] . '<br>';
            }

            return ['code' => 1, 'message' => $err];
        }
    }

}