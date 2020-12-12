<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>xm20期货交易系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link
			href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
			rel="stylesheet" type="text/css" />
	<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css"
		  rel="stylesheet" type="text/css" />
	<link
			href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
			rel="stylesheet" type="text/css" />
	<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css"
		  rel="stylesheet" type="text/css" />
	<link href="assets/global/plugins/uniform/css/uniform.default.css"
		  rel="stylesheet" type="text/css" />
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="assets/admin/pages/css/login.css" rel="stylesheet"
		  type="text/css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES -->
	<link href="assets/global/css/components-rounded.css"
		  id="style_components" rel="stylesheet" type="text/css" />
	<link href="assets/global/css/plugins.css" rel="stylesheet"
		  type="text/css" />
	<link href="assets/admin/layout/css/layout.css" rel="stylesheet"
		  type="text/css" />
	<link href="assets/admin/layout/css/themes/default.css" rel="stylesheet"
		  type="text/css" id="style_color" />
	<link href="assets/admin/layout/css/custom.css" rel="stylesheet"
		  type="text/css" />
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login" onload="initLoginAndRegisterPage()">
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler"></div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="index.jsp"> <img
			src="assets/admin/layout4/img/logo-big.png" alt="" />
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<div class="login-form" action="login" method="post">
		<h3 class="form-title">Sign In</h3>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span> Enter any username and password. </span>
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Username</label>
			<input id="login-username" class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="login_username" />
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Password</label>
			<input id="login-password" class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="login_password" />
		</div>
		<div class="form-actions">
			<button id="login-submit-btn" type="button" class="btn btn-success uppercase">Login</button>
			<label class="rememberme check">
				<input type="checkbox" name="remember" value="1" />Remember
			</label> <a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a>
		</div>
	</div>
	<div class="create-account">
		<p>
			<a href="javascript:;" id="register-btn" class="uppercase">Create an account</a>
		</p>
	</div>
	<!-- END LOGIN FORM -->
	<!-- BEGIN FORGOT PASSWORD FORM -->

	<div id="form_email" class="forget-form" action="" method="post">
		<h3>Forget Password ?</h3>
		<p>Enter your e-mail address below to reset your password.</p>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Email</label>
			<input id="send-mail" class="form-control placeholder-no-fix" type="text" placeholder="Please Enter Your Email" name="Email" />
		</div>
		<div class="form-actions">
			<button type="button" id="sendEmail-back-btn" class="btn btn-default">Back</button>
			<button type="button" id="sendEmail-submit-btn" class="btn btn-success uppercase pull-right">Submit</button>
		</div>
	</div>
    <div id="form_reset_password" class="resetPassword-form" action="" method="post">
        <h3>Reset your password</h3>
        <p>Please enter the new password below:</p>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">New Password</label>
            <input id="new-password-one" class="form-control placeholder-no-fix" type="password" placeholder="Please Enter The New Password" name="ResetPasswordOne" />
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">New Password</label>
            <input id="new-password-two" class="form-control placeholder-no-fix" type="password" placeholder="Please Retype The New Password" name="ResetPasswordTwo" />
        </div>
        <div class="form-actions">
            <button type="button" id="forget-back-btn" class="btn btn-default">Back</button>
            <button type="button" id="resetPassword-submit-btn" class="btn btn-success uppercase pull-right">Submit</button>
        </div>
    </div>

	<!-- END FORGOT PASSWORD FORM -->
	<!-- BEGIN REGISTRATION FORM -->
	<div id="form_register" class="register-form" action="" method="post">
		<h3>Sign Up</h3>
		<p class="hint">Enter your personal details below:</p>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Full Name</label>
			<input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" name="fullname" />
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Email</label>
			<input class="form-control placeholder-no-fix" type="text" placeholder="Email" name="email" />
		</div>


		<p class="hint">Enter your account details below:</p>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Username</label>
			<input id="register_username" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="register_username" />
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Password</label>
			<input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="Password" name="register_password" />
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
			<input id="rpassword" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Re-type Your Password" name="rpassword" />
		</div>

		<div class="form-actions">
			<button type="button" id="register-back-btn" class="btn btn-default">Back</button>
			<button type="button" id="register-submit-btn" class="btn btn-success uppercase pull-right">Submit</button>
		</div>
	</div>
	<!-- END REGISTRATION FORM -->
</div>
<div class="copyright">2020 期货交易系统 0.1</div>
<!-- END LOGIN -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="js/LoginAndRegister.js" type="text/javascript"></script>
<script src="js/submitMailbox.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		Demo.init();
	});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>