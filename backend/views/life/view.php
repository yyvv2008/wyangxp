<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\DetailView;

$this->title = $model->title;
?>
<div class="life-view">

    <p class="buttons">
        <?= Html::a('<i class="fa fa-pencil"></i> ' . Yii::t('app', 'Update'), Url::toRoute(['update', 'id' => $model->id]), ['class' => 'btn btn-default pjax']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'template' => '<tr><th class="view_header" {captionOptions}>{label}</th><td{contentOptions}>{value}</td></tr>',
        'attributes' => [
            'id',
            'title',
            'author',
            'category_format',
            [
                'attribute' => 'cover',
                'format' => 'image',
                'contentOptions' => ['class' => 'view_cover'],
            ],
            [
                'attribute' => 'content',
                'format' => 'raw',
                'contentOptions' => ['class' => 'view_content'],
            ],
            'remend_format',
            'status_format',
            [
                'attribute' => 'created_at',
                'format' => ['date', 'php:Y-m-d H:i:s'],
            ],
            [
                'attribute' => 'updated_at',
                'format' => ['date', 'php:Y-m-d H:i:s'],
            ],
        ],
    ]) ?>

</div>
