<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Url;
use yii\helpers\Html;
use common\models\Menu;

AppAsset::register($this);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <!-- 左侧导航 -->
    <nav class="navbar-default navbar-static-side bg-n" role="navigation">
        <ul id="side-menu">
            <li class="nav-header">
                <div class="main-avatar">
                    <?= Html::img(Yii::$app->request->baseUrl . '/images/avatar.jpg', ['class' => 'img-circle', 'alt' => '酷酷哒']) ?>
                </div>
                <div class="profile">
                    <?= Html::a(Yii::$app->user->identity->username, Url::toRoute(['user/info']), ['class' => 'pjax']) ?>
                </div>
                <div class="logo-element">H+</div>
            </li>
            <?php foreach (Menu::loadMenu() as $menu): ?>
                <li class="nav-body">
                    <?= Html::a('<i class="' . $menu->icon . '"></i>　<span class="menu-label">' . $menu->name . '</span>' . ($menu->sub ? '<span class="arrow"><i class="fa fa-chevron-left"></i></span>' : ''), Url::toRoute([$menu->url]), ['class' => 'pjax']) ?>

                    <?php if ($menu->sub): ?>
                        <ul class="menu-sub collapse">
                            <?php foreach ($menu->sub as $sub): ?>
                                <li>
                                    <?= Html::a($sub->name, Url::toRoute([$sub->url]), ['class' => 'pjax']) ?>
                                </li>
                            <?php endforeach ?>
                        </ul>
                    <?php endif ?>
                </li>
            <?php endforeach ?>
        </ul>
    </nav>

    <div id="content">
        <!-- 顶部导航 -->
        <nav class="navbar navbar-static-top bg-n">
            <div class="navbar-left pull-left">
                <?= Html::a('<i class="fa fa-bars"></i>', '#', ['class' => 'navbar-minimalize btn btn-sm btn-info']) ?>
            </div>

            <ul class="navbar-right pull-right">
                <li>
                    <?= Html::beginForm(['/site/logout'], 'post', ['id' => 'logout']); ?>

                    <?= Html::a('<i class="fa fa-sign-out"></i> ' . yii::t('app', 'logout'), 'javascript:document.getElementById("logout").submit();', []) ?>

                    <?= Html::endForm(); ?>
                </li>
                <li>
                    <?= Html::a('<i class="fa fa-internet-explorer"></i>　' . yii::t('app', 'frontend'), 'http://wyxp', ['target' => '_blank']) ?>
                </li>
            </ul>
        </nav>

        <!-- 内容 -->
        <div id="container">
            <?= $content ?>
        </div>

        <div class="footer bg-n">
            <div class="pull-left">蜀ICP备17007425号 © <?= date('Y') ?></div>
            <div class="pull-right">Powered by Yang</div>
        </div>
    </div>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
