<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<?= Yii::$app->request->baseUrl . '/css/font-awesome.min.css' ?>">
</head>
<style type="text/css">
    html, body {height: 100%; margin: 0px; padding: 0px;}
    body {
        background: url('../images/star.jpg') no-repeat 0 0;
        background-size: 100% 100%;
    }

    .site-login {
        width: 400px;
        position: relative;
        top: calc(50% - 50px);
        margin: 0px auto;
        transform: translateY(-50%);
        text-align: center;
    }

    .avatar {
        text-align: center;
        margin: 0px auto;
        margin-bottom: 30px;
    }

    .avatar img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }

    input, input:focus {
        background: none;
        border: none;
        outline: none;
    }

</style>
<body>

    <div class="site-login">
        <p class='avatar'><?= Html::img('../images/avatars.jpg', []) ?></p>

        <?php $form = ActiveForm::begin([
            'id' => 'login-form',
            'fieldConfig' => [
                'template' => "{label}　{input}\n{hint}\n{error}",
            ],
        ]); ?>

            <?= $form->field($model, 'username')->textInput(['autofocus' => true, 'placeholder' => 'wyang', 'autocomplete' => "off"])->label('<i class="fa fa-user"></i>') ?>

            <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'password'])->label('<i class="fa fa-user"></i>') ?>

            <div class="form-group">
                <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
            </div>

        <?php ActiveForm::end(); ?>

    </div>
</body>
</html>

