<?php 

namespace common\components;

use yii;
use common\models\Menu;
use common\models\User;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;

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
            'category_format' => Yii::t('app', 'Cid'),
            'created_at_format' => Yii::t('app', 'Created At'),
            'updated_at_format' => Yii::t('app', 'Updated At'),
            'start_created_at' => Yii::t('app', 'Start Created At'),
            'end_created_at' => Yii::t('app', 'End Created At'),
            'status_format' => Yii::t('app', 'Status'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    public function getAuthor()
    {
        return User::findOne(['id' => $this->uid])->username;
    }

    public function getCategory_format()
    {
        if ($this->hasAttribute('cid')) {
            return Menu::findOne(['id' => $this->cid])->name;
        }
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

    public function getRemend_format()
    {
        if ($this->hasAttribute('remend')) {
            $remendOption = self::loadRemend();
            return $remendOption[$this->remend];
        }
    }

    public static function loadremend()
    {
        return [
            self::STATUS_NO => yii::t('app', 'Not Remend'),
            self::STATUS_YES => yii::t('app', 'Remend'),
        ];
    }

    public function loadCategory()
    {
        $models = Menu::findAll(['parent_id' => $this->class_id]);

        $datas = [];
        foreach ($models as $model) {
            $datas[$model->id] = $model->name;
        }

        return $datas;
    }

    public static function loadAuthor()
    {
        $models = User::find()->all();

        $datas = [];
        foreach ($models as $model) {
            $datas[$model->id] = $model->username;
        }

        return $datas;
    }

    public function beforeSave($insert)
    {
        if ($this->hasAttribute('cover')) {
            $upload = UploadedFile::getInstance($this, 'cover');
            if ($upload !== null) {
                $uploadPath = yii::getAlias('@cover/');
                if (!FileHelper::createDirectory($uploadPath)) {
                    $this->addError('cover', Yii::t('app', "Create directory failed ") . $uploadPath);
                    return false;
                }

                $fullName = $uploadPath . uniqid() . '_' . $upload->baseName . '.' . $upload->extension;
                if (!$upload->saveAs($fullName)) {
                    $this->addError('cover', yii::t('app', 'Upload {attribute} error: ' . $upload->error, ['attribute' => yii::t('app', 'Cover')]) . ': ' . $fullName);
                    return false;
                }

                $this->cover = str_replace(yii::getAlias('@backend/web'), '', $fullName);
                if(!$insert){
                    $file = yii::getAlias('@backend/web') . $this->getOldAttribute('cover');
                    if (file_exists($file) && is_file($file)) {
                        unlink($file);
                    }
                }
            } else {
                $this->cover = $this->getOldAttribute('cover');
            }            
        }

        if ($this->hasAttribute('uid')) {
            $this->uid = Yii::$app->user->id;
        }

        return parent::beforeSave($insert);
    }
}
