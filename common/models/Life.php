<?php

namespace common\models;

use Yii;
use yii\helpers\ArrayHelper;
use common\models\Menu;

/**
 * This is the model class for table "life".
 *
 * @property integer $id
 * @property string $title
 * @property integer $uid
 * @property integer $cid
 * @property string $cover
 * @property string $content
 * @property integer $remend
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class Life extends \common\components\BaseModel
{
    const CLASS_ID = 2;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'life';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'cid', 'content'], 'required'],
            [['uid', 'cid', 'remend', 'status', 'created_at', 'updated_at'], 'integer'],
            [['content'], 'string'],
            [['title'], 'string', 'max' => 60],
            [['cover'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return ArrayHelper::merge(parent::attributeLabels(), [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'uid' => Yii::t('app', 'Uid'),
            'cid' => Yii::t('app', 'Cid'),
            'cover' => Yii::t('app', 'Cover'),
            'content' => Yii::t('app', 'Content'),
            'remend' => Yii::t('app', 'Remend'),
            'status' => Yii::t('app', 'Status'),
        ]);
    }

    public function beforeSave($insert)
    {
        if (!parent::beforeSave($insert)) {
            return false;
        }

        $this->uid = Yii::$app->user->id;

        return true;
    }

    public static function loadCategory()
    {
        $models = Menu::findAll(['parent_id' => self::CLASS_ID]);

        return self::loadOptions($models);
    }
}
