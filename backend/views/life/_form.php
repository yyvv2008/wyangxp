<?php

use yii\web\View;
use yii\helpers\Html;
use common\models\Life;
use common\components\BaseActiveForm;
use common\components\Ueditor;

$text = yii::t('app', 'Choose File');
$js = <<<EOF
    var common = {
        chooseFile: "$text",
    }
    $("input[type=file]").prettyFile({text:common.chooseFile});
EOF;
$this->registerJs($js, View::POS_END);
?>

<div class="life-form">

    <?php $form = BaseActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cid')->dropDownList((new Life)->loadCategory(), []) ?>

    <?= $form->field($model, 'cover')->imgInput(['style' => 'max-width:200px; max-height:200px; margin: 5px 0px;']); ?>

    <?= $form->field($model, 'content')->widget(Ueditor::className(), ['options' => ['class' => 'form_ueditor']]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => 'btn btn-main']) ?>
    </div>

    <?php BaseActiveForm::end(); ?>

</div>
