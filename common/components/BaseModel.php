<?php 

namespace common\components;

use yii;
use common\models\Menu;

/**
 * summary
 */
class BaseModel extends \yii\db\ActiveRecord
{
	const STATUS_NO = 0;
	const STATUS_YES = 1;

    public $start_created_at;
    public $end_created_at;
    public $start_updated_at;
    public $end_updated_at;

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            \yii\behaviors\TimestampBehavior::className(),
        ];
    }

            

    public function attributeLabels()
    {
        return [
            'created_at_format' => Yii::t('app', 'Created At'),
            'updated_at_format' => Yii::t('app', 'Updated At'),
            'start_created_at' => Yii::t('app', 'Start Created At'),
            'end_created_at' => Yii::t('app', 'End Created At'),
            'status_format' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    public function getStatus_format()
    {
        if ($this->hasAttribute('status')) {
        	$statusOption = self::loadStatus();
            return $statusOption[$this->status];
        }
    }

    public static function loadStatus()
    {
    	return [
    		self::STATUS_NO => yii::t('app', 'Close'),
    		self::STATUS_YES => yii::t('app', 'Open'),
    	];
    }

    public static function loadOptions($models = [])
    {
        $datas = [];
        foreach ($models as $model) {
            $datas[$model->id] = $model->name;
        }

        return $datas;
    }
}
