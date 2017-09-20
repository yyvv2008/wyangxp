<?php

use yii\helpers\Html;
use common\models\Learning;
use kartik\markdown\MarkdownEditor;
use common\components\BaseActiveForm;

?>

<?php $this->beginPage() ?>
<?php $this->beginBody() ?>

<div class="learning-form">

    <?php $form = BaseActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cid')->dropDownList((new Learning)->loadCategory(), []) ?>

    <?= $form->field($model, 'cover')->imgInput(['class' => 'img_input']); ?>

    <?= $form->field($model, 'content')->widget(MarkdownEditor::classname(), ['height' => 300, 'encodeLabels' => false, 'footer' => '']); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => 'btn btn-main']) ?>
    </div>

    <?php BaseActiveForm::end(); ?>

</div>

<?php $this->endBody() ?>
<?php $this->endPage() ?>

<script>
    $(function() {
        var common = {
            chooseFile: "选择文件",
        }
        $("input[type=file]").prettyFile({text:common.chooseFile});
        $('input[type=file]').bind('change', function () {
            if (typeof FileReader === 'undefined') {
                return;
            }
            var that = $(this);
            var files = $(this)[0].files;

            if(that.parent().parent().parent().attr('class').indexOf("img_upload") >= 0){
                // if(!/image\/\w+/.test(files[0].type)){
                //     layer.tips(tips.onlyPictureCanBeSelected, that.parent().parent());
                //     return false;
                // }
                var reader = new FileReader();
                reader.readAsDataURL(files[0]);
                reader.onload = function (e) {
                    that.parents("div.img_upload").find("img").attr("src", this.result);
                }
            }
        });
    })
</script>