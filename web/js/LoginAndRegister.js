function initLoginAndRegisterPage(){
    jQuery('.forget-form').hide();
    jQuery('.resetPassword-form').hide();
}


jQuery('#register-btn').click(function() {
    jQuery('.login-form').hide();
    jQuery('.create-account').hide();
    jQuery('.register-form').show();
});

jQuery('#forget-password').click(function() {
    jQuery('.login-form').hide();
    jQuery('.create-account').hide();
    jQuery('.forget-form').show();
});
jQuery('#sendEmail-back-btn').click(function (){
    jQuery('.forget-form').hide();
    jQuery('.create-account').show();
    jQuery('.login-form').show();
});
jQuery('#forget-back-btn').click(function (){
    jQuery('.resetPassword-form').hide();
    jQuery('.create-account').show();
    jQuery('.login-form').show();
});
jQuery('#back-btn').click(function() {
    jQuery('.login-form').show();
    jQuery('.create-account').show();
    jQuery('.forget-form').hide();
});

jQuery('#register-back-btn').click(function() {
    jQuery('.login-form').show();
    jQuery('.create-account').show();
    jQuery('.register-form').hide();
});
jQuery('#register-sendmail-btn').click(function (){
    $.ajax({
       url:'sendMailServlet',
       data:{
           "email":$('#register_mailbox').val(),
       },
       type:'post',
        datatype:'json',
        success:function (message){
           alert(message.msg);
        }
    });
});
jQuery('#register-submit-btn').click(function (){
    $.ajax({
        url:'register',
        data:{
            "register_fullname":$('#register_fullname').val(),
            "register_mailbox":$('#register_mailbox').val(),
            "register_username": $('#register_username').val(),
            "register_password": $('#register_password').val(),
            "rpassword": $('#rpassword').val(),
            "register_verifycode":$('#register-verify-code').val(),
        },
        type:'post',
        datatype:'json',
        success:function (message){
            alert(message.msg);
            if(message.msg == "注册成功"){
                jQuery('.login-form').show();
                jQuery('.create-account').show();
                jQuery('.register-form').hide();
            }
        },
        error:function (){
            console.log("提交失败");
        }
    });
});
jQuery('#sendEmail-submit-btn').click(function (){
    $.ajax({
        url:'sendMailServlet',
        data:{
           "email":$('#send-mail').val(),
        },
        type:'post',
        datatype:'json',
        success:function (message){
           alert(message.msg);
           if(message.msg == "邮件发送成功！"){
               jQuery('.forget-form').hide();
               jQuery('.resetPassword-form').show();
           }
           else {
               window.location.href= 'LoginAndRegister.jsp'
           }
        },
        error:function (){
            console.log("邮件发送失败！");
        }
    });
});
jQuery('#login-submit-btn').click(function (){
   $.ajax({
       url:'login',
       data:{
           "login_username":$('#login-username').val(),
           "login_password":$('#login-password').val(),
       },
       type:'post',
       datatype:'json',
       success:function(message){
           if(message.msg == "登录成功"){
               window.location.href='index.jsp';
           }
           else {
               alert(message.msg);
           }
       },
       error:function (){
           console.log("登录失败！")
       }
   });
});
jQuery('#resetPassword-submit-btn').click(function (){
    $.ajax({
       url:'resetPasswordServlet',
       data:{
           'forget_account_number':$('#forget-account-number').val(),
           'new_password_one':$('#new-password-one').val(),
           'new_password_two':$('#new-password-two').val(),
           'forget_verify_code':$('#forget-verify-code').val(),
       },
       type:'post',
       datatype:'json',
       success:function (message){
           alert(message.msg);
           if (message.msg == '更改密码成功！'){
               window.location.href='LoginAndRegister.jsp';
           }
       },
       error:function (){
           console.log("修改密码失败!");
       }
   });
});