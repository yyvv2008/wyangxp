<?php

use yii\helpers\Html;
use common\models\Menu;
use common\components\BaseActiveForm;

?>

<div class="menu-form">

    <?php $form = BaseActiveForm::begin(); ?>

    <?= $form->field($model, 'parent_id')->dropDownList(Menu::loadParentId(), []) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'icon')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => 'btn btn-info']) ?>
    </div>

    <?php BaseActiveForm::end(); ?>

</div>
