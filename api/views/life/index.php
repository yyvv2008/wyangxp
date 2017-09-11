<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use common\models\Life;

$this->title = Yii::t('app', 'No Hurry Hug Me');
?>

<div class="life-index">

    <p class="buttons">
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-default']) ?>
    </p>

    <?php Pjax::begin(); ?>
    
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'rowOptions' => ['class' => 'grid_cover'],
            'headerRowOptions' => ['class' => 'grid_header'],
            'columns' => [
                // ['class' => 'yii\grid\SerialColumn'],

                [
                    'attribute' => 'id',
                    'filter' => '',
                ],
                [
                    'attribute' => 'cover',
                    'format' => 'image',
                    'filter' => '',
                ],
                'title',
                [
                    'attribute' => 'uid',
                    'value' => function($model) {
                        return $model->author;
                    },
                    'filter' => Life::loadAuthor(),
                ],
                // [
                //     'attribute' => 'cid',
                //     'value' => function($model) {
                //         return $model->category_format;
                //     },
                //     'filter' => (new Life)->loadCategory(),
                // ],
                // 'content:ntext',
                [
                    'attribute' => 'remend',
                    'label' => yii::t('app', 'Remend'),
                    'value' => function($model) {
                        return $model->remend_format;
                    },
                    'filter' => Life::loadRemend(),
                ],
                [
                    'attribute' => 'status',
                    'label' => yii::t('app', 'Status'),
                    'value' => function($model) {
                        return $model->status_format;
                    },
                    'filter' => Life::loadStatus(),
                ],
                [
                    'attribute' => 'created_at',
                    'format' => ['date', 'php:Y-m-d H:i:s'],
                ],
                [
                    'attribute' => 'updated_at',
                    'format' => ['date', 'php:Y-m-d H:i:s'],
                ],
                [
                    'class' => 'yii\grid\ActionColumn',
                    'template' => '{view}　{update}　{delete}',
                ],
            ],
        ]); ?>

    <?php Pjax::end(); ?>

</div>