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