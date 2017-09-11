$(function() {
	var common = {
        chooseFile: "选择文件",
    }
    $("input[type=file]").prettyFile({text:common.chooseFile});

    
	$('.nav-body>a').click(function() {
		var ul = $(this).siblings('ul');

		if (ul.length) {
			$(this).toggleClass('white');
			ul.slideToggle();
			$(this).find('.arrow i').toggleClass("fa-chevron-left").toggleClass("fa-chevron-down");

			return false;
		}
	});

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

});