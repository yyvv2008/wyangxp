<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

$this->title = $model->title;
?>
<div class="life-view">

    <?= DetailView::widget([
        'model' => $model,
        'template' => '<tr><th class="view_header" {captionOptions}>{label}</th><td{contentOptions}>{value}</td></tr>',
        'attributes' => [
            'id',
            'title',
            'uid',
            'cid',
            [
                'attribute' => 'cover',
                'format' => 'image',
                'contentOptions' => ['class' => 'view_cover'],
            ],
            'content:raw',
            'remend',
            'status',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
