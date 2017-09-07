<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Learning */

$this->title = Yii::t('app', 'Create Learning');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Learnings'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="learning-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
