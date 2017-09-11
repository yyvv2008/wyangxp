<?php

use yii\helpers\Html;
use common\models\Learning;
use common\components\BaseActiveForm;
use common\components\Ueditor;
use backend\assets\MarkdownAsset;
use kartik\markdown\MarkdownEditor;

// MarkdownAsset::register($this);
?>

<div class="learning-form">

    <?php $form = BaseActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cid')->dropDownList((new Learning)->loadCategory(), []) ?>

    <?= $form->field($model, 'cover')->imgInput(['class' => 'img_input']); ?>

    <?= $form->field($model, 'content')->widget(Ueditor::className(), ['options' => ['class' => 'form_ueditor']]) ?>
    
    <?= $form->field($model, 'content')->widget(MarkdownEditor::classname(), ['height' => 300, 'encodeLabels' => false, 'footer' => '']); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => 'btn btn-main']) ?>
    </div>

    <?php BaseActiveForm::end(); ?>

</div>
