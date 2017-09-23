<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\MenuSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'No Hurry Hug Me');
?>

<style>
    .filters {display: none;}
</style>

<div class="menu-index">
    <p class="buttons">
        <?= Html::a('<i class="fa fa-plus"></i> ' . Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-default pjax']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'tableOptions' => ['class' => 'table table-bordered'],
            'headerRowOptions' => ['class' => 'grid_header'],
            'columns' => [
                // ['class' => 'yii\grid\SerialColumn'],

                'id',
                'parent_id',
                'name',
                'url',
                'icon',
                // 'type',
                'status_format',
                [
                    'attribute' => 'created_at',
                    'format' => ['date', 'php:Y-m-d H:i:s'],
                    'headerOptions' => ['width' => '180px'],
                    // 'filter' => Html::activeInput('text', $searchModel, 'start_created_at', [
                    //         'class' => 'form-control layer-date',
                    //         'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});"
                    //     ]) . Html::activeInput('text', $searchModel, 'end_created_at', [
                    //         'class' => 'form-control layer-date',
                    //         'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
                    //     ]),
                ],
                [
                    'attribute' => 'updated_at',
                    'format' => ['date', 'php:Y-m-d H:i:s'],
                    'headerOptions' => ['width' => '180px'],
                    // 'filter' => Html::activeInput('text', $searchModel, 'start_updated_at', [
                    //         'class' => 'form-control layer-date',
                    //         'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});"
                    //     ]) . Html::activeInput('text', $searchModel, 'end_updated_at', [
                    //         'class' => 'form-control layer-date',
                    //         'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
                    //     ]),
                ],

                [
                    'class' => 'yii\grid\ActionColumn',
                    'template' => '{update}　{delete}',
                    'headerOptions' => ['width' => '100px'],
                    'buttonOptions' => ['data-pjax' => '1', 'class' => 'pjax'],
                ],
            ],
        ]); ?>
    <?php Pjax::end(); ?>
</div>
