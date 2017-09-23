<?php
namespace common\components;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\components\ueditor\UeditorAction;

/**
 * Site controller
 */
class BaseBackendController extends Controller
{
    public $layout = false;

    public function init()
    {
        parent::init();

        if (Yii::$app->user->isGuest) {
            return $this->redirect(['/site/login']);
        }

        if (!Yii::$app->request->isPjax) {
            $this->layout = 'main';
        }
    }

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        // 'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'transparent' => true,
                'maxLength' => 4,
                'minLength' => 4,
                'offset' => 1,
                'height' => 50,
                'width' => 80,
                'backColor' => 0x2040A0,
                'foreColor' => 0xFFFFFF,
            ],
            'ueditor' => [
                'class' => UeditorAction::className(),
            ],
        ];
    }

    public function updateStatus($model, $field, $val)
    {
        yii::$app->getResponse()->format = \yii\web\Response::FORMAT_JSON;
        
        $model->$field = $val;
        if ($model->save(false)) {
            return ['code' => 0, 'message' => yii::t('app', 'Success')];
        }

        $errors = $model->getErrors();
        $err = '';
        foreach ($errors as $v) {
            $err .= $v[0] . '<br>';
        }

        return ['code' => 1, 'message' => $err];
    }

}
