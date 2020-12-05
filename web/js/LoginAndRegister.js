jQuery('#register-btn').click(function() {
    jQuery('.login-form').hide();
    jQuery('.register-form').show();
});

jQuery('#forget-password').click(function() {
    jQuery('.login-form').hide();
    jQuery('.forget-form').show();
});

jQuery('#back-btn').click(function() {
    jQuery('.login-form').show();
    jQuery('.forget-form').hide();
});

jQuery('#register-back-btn').click(function() {
    jQuery('.login-form').show();
    jQuery('.register-form').hide();
});

jQuery('#register-submit-btn').click(function (){
    $.ajax({
        url:'register',
        data:{
            "register_username": $('#register_username').val(),
            "register_password": $('#register_password').val(),
            "rpassword": $('#rpassword').val(),
        },
        type:'post',
        datatype:'json',
        success:function (message){
            alert(message.msg);
            if(message.msg == "注册成功"){
                jQuery('.login-form').show();
                jQuery('.register-form').hide();
            }
        },
        error:function (){
            console.log("提交失败");
        }
    });
});