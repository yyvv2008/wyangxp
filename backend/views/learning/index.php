<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use common\models\Learning;

$this->title = Yii::t('app', 'No Hurry Hug Me');
?>
<div class="learning-index">

    <p class="buttons">
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-default pjax']) ?>
    </p>

    <?php Pjax::begin(); ?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            // 'rowOptions' => ['class' => 'grid_cover'],
            'headerRowOptions' => ['class' => 'grid_header'],
            'pager' => [
                'options' => ['class' => 'pagination pull-right'],
                'firstPageLabel'=>"首页",
                'prevPageLabel'=>'上一页',
                'nextPageLabel'=>'下一页',
                'lastPageLabel'=>'尾页',
            ],
            'columns' => [
                // ['class' => 'yii\grid\SerialColumn'],

                [
                    'attribute' => 'id',
                    'filter' => '',
                ],
                [
                    'attribute' => 'cover',
                    'format' => ['image', ['width' => 100, 'height' => 100, 'class' => 'img-circle']],
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
                [
                    'attribute' => 'remend',
                    'label' => yii::t('app', 'Remend'),
                    'format' => 'raw',
                    'value' => function($model) {
                        if ($model->remend) {
                            $val = 0;
                        } else {
                            $val = 1;
                        }

                        return Html::a($model->remend_format, Url::toRoute(['status',
                            'id' => $model->id,
                            'field' => 'remend',
                            'val' => $val,
                        ]), [
                            'data-confirm' => yii::t('app', 'Are you sure'),
                            'data-method' => 'post',
                            'data-pjax' => '0',     
                        ]);
                    },
                    'filter' => Learning::loadRemend(),
                ],
                [
                    'attribute' => 'status',
                    'label' => yii::t('app', 'Status'),
                    'format' => 'raw',
                    'value' => function($model) {
                        if ($model->status) {
                            $val = 0;
                        } else {
                            $val = 1;
                        }

                        return Html::a($model->status_format, Url::toRoute(['status',
                            'id' => $model->id,
                            'field' => 'status',
                            'val' => $val,
                        ]), [
                            'data-confirm' => yii::t('app', 'Are you sure'),
                            'data-method' => 'post',
                            'data-pjax' => '0',     
                        ]);
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
                    'buttonOptions' => ['data-pjax' => '1', 'class' => 'pjax'],
                ],
            ],
        ]); ?>
        
    <?php Pjax::end(); ?>

</div>
