<?php 

namespace common\components;

use Yii;
use yii\widgets\ActiveForm;

/**
* base ActiveForm
*/
class BaseActiveForm extends ActiveForm
{
    public $options = [];
    public $fieldClass = 'common\components\BaseActiveField';
    public $fieldConfig = [
        'template' => "{label}：{input}\n{hint}\n{error}",
    ];

    public function init()
    {
    	$id = Yii::$app->controller->id . '-' . Yii::$app->controller->action->id;
    	if (!isset($this->options['id'])) {
            $this->options['id'] = $this->setId($id);
        }

        parent::init();
    }

}
