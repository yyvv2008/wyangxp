<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use common\models\Learning;

$this->title = Yii::t('app', 'No Hurry Hug Me');
?>
<div class="learning-index">

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
                    'filter' => Learning::loadAuthor(),
                ],
                // [
                //     'attribute' => 'cid',
                //     'value' => function($model) {
                //         return $model->category_format;
                //     },
                //     'filter' => (new Learning)->loadCategory(),
                // ],
                // 'content:ntext',
                [
                    'attribute' => 'remend',
                    'label' => yii::t('app', 'Remend'),
                    'value' => function($model) {
                        return $model->remend_format;
                    },
                    'filter' => Learning::loadRemend(),
                ],
                [
                    'attribute' => 'status',
                    'label' => yii::t('app', 'Status'),
                    'value' => function($model) {
                        return $model->status_format;
                    },
                    'filter' => Learning::loadStatus(),
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
                    // 'buttonOptions' => ['data-pjax' => '1', 'class' => 'pjax'],
                ],
            ],
        ]); ?>
        
    <?php Pjax::end(); ?>

</div>
