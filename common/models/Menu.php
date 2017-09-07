<?php

namespace common\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $url
 * @property integer $type
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class Menu extends \common\components\BaseModel
{
    public $sub = [];

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'type', 'status', 'created_at', 'updated_at'], 'integer'],
            [['name', 'url'], 'required'],
            [['name', 'url', 'icon'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return ArrayHelper::merge(parent::attributeLabels(), [
            'id' => Yii::t('app', 'ID'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'name' => Yii::t('app', 'Name'),
            'url' => Yii::t('app', 'Url'),
            'icon' => Yii::t('app', 'Icon'),
            'type' => Yii::t('app', 'Type'),
            'status' => Yii::t('app', 'Status'),
        ]);
    }

    public static function loadMenu()
    {
        $models = self::findAll(['parent_id' => 0]);
        $menus = self::find()->all();

        foreach ($models as $m) {
            foreach ($menus as $menu) {
                if ($menu->parent_id == $m->id) {
                    $m->sub[] = $menu;
                }
            }
        }

        return $models;
    }

    public static function loadParentId()
    {
        $models = self::findAll(['parent_id' => 0]);

        $datas = ['0' => '默认'];
        foreach ($models as $model) {
            $datas[$model->id] = $model->name;
        }

        return $datas;
    }
}
