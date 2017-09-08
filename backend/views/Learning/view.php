<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

$this->title = $model->title;
?>
<div class="learning-view">

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
