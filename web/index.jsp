<%@page language="java"
        import="java.util.*,java.sql.*,deal.entity.*,deal.dao.*,deal.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="gp" scope="page" class="deal.daoimpl.GpDaoImpl"/>
<jsp:useBean id="pg" scope="page" class="deal.daoimpl.PageDaoImpl"/>

<%
    //判断是否未登录，用的session判断，可用filter，之后再说
    String name=(String)session.getAttribute("loginUsername");
    String authority=(String)session.getAttribute("Authority");
    if(name==null){
        response.sendRedirect("LoginAndRegister.jsp");
    }
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>期货交易系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
            rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link
            href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
            rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css"/>
    <link
            href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
            rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
    <link
            href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"
            rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/fullcalendar/fullcalendar.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/jqvmap/jqvmap/jqvmap.css"
          rel="stylesheet" type="text/css"/>
    <link href="assets/global/plugins/morris/morris.css" rel="stylesheet"
          type="text/css">
    <!-- END PAGE LEVEL PLUGIN STYLES -->
    <!-- BEGIN PAGE STYLES -->
    <link href="assets/admin/pages/css/tasks.css" rel="stylesheet"
          type="text/css"/>
    <!-- END PAGE STYLES -->
    <!-- BEGIN THEME STYLES -->
    <!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
    <link href="assets/global/css/components-rounded.css"
          id="style_components" rel="stylesheet" type="text/css"/>
    <link href="assets/global/css/plugins.css" rel="stylesheet"
          type="text/css"/>
    <link href="assets/admin/layout4/css/layout.css" rel="stylesheet"
          type="text/css"/>
    <link href="assets/admin/layout4/css/themes/light.css" rel="stylesheet"
          type="text/css" id="style_color"/>
    <link href="assets/admin/layout4/css/custom.css" rel="stylesheet"
          type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo" onload="initPage('<%=authority%>','<%=name%>')">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="index.jsp"> <img
                    src="assets/admin/layout4/img/logo-light.png" alt="logo"
                    class="logo-default"/>
            </a>
            <div class="menu-toggler sidebar-toggler">
                <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler"
           data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN PAGE ACTIONS -->
        <!-- DOC: Remove "hide" class to enable the page header actions -->
        <div class="page-actions">
            <div class="btn-group">
                <button type="button" class="btn red-haze btn-sm dropdown-toggle"
                        data-toggle="dropdown" data-hover="dropdown"
                        data-close-others="true">
                    <span class="hidden-sm hidden-xs">Actions&nbsp;</span><i
                        class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="javascript:;"> <i class="icon-docs"></i> New
                        Post
                    </a></li>
                    <li><a href="javascript:;"> <i class="icon-tag"></i> New
                        Comment
                    </a></li>
                    <li><a href="javascript:;"> <i class="icon-share"></i>
                        Share
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="javascript:;"> <i class="icon-flag"></i>
                        Comments <span class="badge badge-success">4</span>
                    </a></li>
                    <li><a href="javascript:;"> <i class="icon-users"></i>
                        Feedbacks <span class="badge badge-danger">2</span>
                    </a></li>
                </ul>
            </div>
        </div>
        <!-- END PAGE ACTIONS -->
        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <!-- BEGIN HEADER SEARCH BOX -->
            <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
            <form class="search-form" action="extra_search.html" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control input-sm"
                           placeholder="Search..." name="query"> <span
                        class="input-group-btn"> <a href="javascript:;"
                                                    class="btn submit"><i class="icon-magnifier"></i></a>
						</span>
                </div>
            </form>
            <!-- END HEADER SEARCH BOX -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="separator hide"></li>
                    <!-- BEGIN NOTIFICATION DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li
                            class="dropdown dropdown-extended dropdown-notification dropdown-dark"
                            id="header_notification_bar"><a href="javascript:;"
                                                            class="dropdown-toggle" data-toggle="dropdown"
                                                            data-hover="dropdown" data-close-others="true"> <i
                            class="icon-bell"></i> <span class="badge badge-success">
									7 </span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>
                                    <span class="bold">12 pending</span> notifications
                                </h3> <a href="extra_profile.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 250px;"
                                    data-handle-color="#637283">
                                    <li><a href="javascript:;"> <span class="time">just
													now</span> <span class="details"> <span
                                            class="label label-sm label-icon label-success"> <i
                                            class="fa fa-plus"></i>
												</span> New user registered.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">3
													mins</span> <span class="details"> <span
                                            class="label label-sm label-icon label-danger"> <i
                                            class="fa fa-bolt"></i>
												</span> Server #12 overloaded.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">10
													mins</span> <span class="details"> <span
                                            class="label label-sm label-icon label-warning"> <i
                                            class="fa fa-bell-o"></i>
												</span> Server #2 not responding.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">14
													hrs</span> <span class="details"> <span
                                            class="label label-sm label-icon label-info"> <i
                                            class="fa fa-bullhorn"></i>
												</span> Application error.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">2
													days</span> <span class="details"> <span
                                            class="label label-sm label-icon label-danger"> <i
                                            class="fa fa-bolt"></i>
												</span> Database overloaded 68%.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">3
													days</span> <span class="details"> <span
                                            class="label label-sm label-icon label-danger"> <i
                                            class="fa fa-bolt"></i>
												</span> A user IP blocked.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">4
													days</span> <span class="details"> <span
                                            class="label label-sm label-icon label-warning"> <i
                                            class="fa fa-bell-o"></i>
												</span> Storage Server #4 not responding dfdfdfd.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">5
													days</span> <span class="details"> <span
                                            class="label label-sm label-icon label-info"> <i
                                            class="fa fa-bullhorn"></i>
												</span> System Error.
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="time">9
													days</span> <span class="details"> <span
                                            class="label label-sm label-icon label-danger"> <i
                                            class="fa fa-bolt"></i>
												</span> Storage server failed.
											</span>
                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- END NOTIFICATION DROPDOWN -->
                    <li class="separator hide"></li>
                    <!-- BEGIN INBOX DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li
                            class="dropdown dropdown-extended dropdown-inbox dropdown-dark"
                            id="header_inbox_bar"><a href="javascript:;"
                                                     class="dropdown-toggle" data-toggle="dropdown"
                                                     data-hover="dropdown" data-close-others="true"> <i
                            class="icon-envelope-open"></i> <span class="badge badge-danger">
									4 </span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="external">
                                <h3>
                                    You have <span class="bold">7 New</span> Messages
                                </h3> <a href="inbox.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 275px;"
                                    data-handle-color="#637283">
                                    <li><a href="inbox.html?a=view"> <span class="photo">
													<img src="assets/admin/layout3/img/avatar2.jpg"
                                                         class="img-circle" alt="">
											</span> <span class="subject"> <span class="from">
														Lisa Wong </span> <span class="time">Just Now </span>
											</span> <span class="message"> Vivamus sed auctor nibh congue
													nibh. auctor nibh auctor nibh... </span>
                                    </a></li>
                                    <li><a href="inbox.html?a=view"> <span class="photo">
													<img src="assets/admin/layout3/img/avatar3.jpg"
                                                         class="img-circle" alt="">
											</span> <span class="subject"> <span class="from">
														Richard Doe </span> <span class="time">16 mins </span>
											</span> <span class="message"> Vivamus sed congue nibh auctor
													nibh congue nibh. auctor nibh auctor nibh... </span>
                                    </a></li>
                                    <li><a href="inbox.html?a=view"> <span class="photo">
													<img src="assets/admin/layout3/img/avatar1.jpg"
                                                         class="img-circle" alt="">
											</span> <span class="subject"> <span class="from"> Bob
														Nilson </span> <span class="time">2 hrs </span>
											</span> <span class="message"> Vivamus sed nibh auctor nibh
													congue nibh. auctor nibh auctor nibh... </span>
                                    </a></li>
                                    <li><a href="inbox.html?a=view"> <span class="photo">
													<img src="assets/admin/layout3/img/avatar2.jpg"
                                                         class="img-circle" alt="">
											</span> <span class="subject"> <span class="from">
														Lisa Wong </span> <span class="time">40 mins </span>
											</span> <span class="message"> Vivamus sed auctor 40% nibh
													congue nibh... </span>
                                    </a></li>
                                    <li><a href="inbox.html?a=view"> <span class="photo">
													<img src="assets/admin/layout3/img/avatar3.jpg"
                                                         class="img-circle" alt="">
											</span> <span class="subject"> <span class="from">
														Richard Doe </span> <span class="time">46 mins </span>
											</span> <span class="message"> Vivamus sed congue nibh auctor
													nibh congue nibh. auctor nibh auctor nibh... </span>
                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- END INBOX DROPDOWN -->
                    <li class="separator hide"></li>
                    <!-- BEGIN TODO DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li
                            class="dropdown dropdown-extended dropdown-tasks dropdown-dark"
                            id="header_task_bar"><a href="javascript:;"
                                                    class="dropdown-toggle" data-toggle="dropdown"
                                                    data-hover="dropdown" data-close-others="true"> <i
                            class="icon-calendar"></i> <span class="badge badge-primary">
									3 </span>
                    </a>
                        <ul class="dropdown-menu extended tasks">
                            <li class="external">
                                <h3>
                                    You have <span class="bold">12 pending</span> tasks
                                </h3> <a href="page_todo.html">view all</a>
                            </li>
                            <li>
                                <ul class="dropdown-menu-list scroller" style="height: 275px;"
                                    data-handle-color="#637283">
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">New release v1.2 </span> <span
                                            class="percent">30%</span>
											</span> <span class="progress"> <span style="width: 40%;"
                                                                                  class="progress-bar progress-bar-success"
                                                                                  aria-valuenow="40" aria-valuemin="0"
                                                                                  aria-valuemax="100"><span
                                            class="sr-only">40% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">Application deployment</span> <span
                                            class="percent">65%</span>
											</span> <span class="progress"> <span style="width: 65%;"
                                                                                  class="progress-bar progress-bar-danger"
                                                                                  aria-valuenow="65"
                                                                                  aria-valuemin="0" aria-valuemax="100"><span
                                            class="sr-only">65% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">Mobile app release</span> <span
                                            class="percent">98%</span>
											</span> <span class="progress"> <span style="width: 98%;"
                                                                                  class="progress-bar progress-bar-success"
                                                                                  aria-valuenow="98" aria-valuemin="0"
                                                                                  aria-valuemax="100"><span
                                            class="sr-only">98% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">Database migration</span> <span
                                            class="percent">10%</span>
											</span> <span class="progress"> <span style="width: 10%;"
                                                                                  class="progress-bar progress-bar-warning"
                                                                                  aria-valuenow="10" aria-valuemin="0"
                                                                                  aria-valuemax="100"><span
                                            class="sr-only">10% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">Web server upgrade</span> <span
                                            class="percent">58%</span>
											</span> <span class="progress"> <span style="width: 58%;"
                                                                                  class="progress-bar progress-bar-info"
                                                                                  aria-valuenow="58"
                                                                                  aria-valuemin="0" aria-valuemax="100"><span
                                            class="sr-only">58% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">Mobile development</span> <span
                                            class="percent">85%</span>
											</span> <span class="progress"> <span style="width: 85%;"
                                                                                  class="progress-bar progress-bar-success"
                                                                                  aria-valuenow="85" aria-valuemin="0"
                                                                                  aria-valuemax="100"><span
                                            class="sr-only">85% Complete</span></span>
											</span>
                                    </a></li>
                                    <li><a href="javascript:;"> <span class="task">
													<span class="desc">New UI release</span> <span
                                            class="percent">38%</span>
											</span> <span class="progress progress-striped"> <span
                                            style="width: 38%;"
                                            class="progress-bar progress-bar-important"
                                            aria-valuenow="18" aria-valuemin="0" aria-valuemax="100"><span
                                            class="sr-only">38% Complete</span></span>
											</span>
                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- END TODO DROPDOWN -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-user dropdown-dark"><a
                            href="javascript:;" class="dropdown-toggle"
                            data-toggle="dropdown" data-hover="dropdown"
                            data-close-others="true"> <span
                            class="username username-hide-on-mobile" id="nameSpan"></span>
                        <!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
                        <img alt="" class="img-circle"
                             src="assets/admin/layout4/img/avatar9.jpg"/>
                    </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li><a href="extra_profile.html"> <i class="icon-user"></i>
                                My Profile
                            </a></li>
                            <li><a href="page_calendar.html"> <i
                                    class="icon-calendar"></i> My Calendar
                            </a></li>
                            <li><a href="inbox.html"> <i class="icon-envelope-open"></i>
                                My Inbox <span class="badge badge-danger"> 3 </span>
                            </a></li>
                            <li><a href="page_todo.html"> <i class="icon-rocket"></i>
                                My Tasks <span class="badge badge-success"> 7 </span>
                            </a></li>
                            <li class="divider"></li>
                            <li><a href="extra_lock.html"> <i class="icon-lock"></i>
                                Lock Screen
                            </a></li>
                            <li>
                                <a href="LoginAndRegister.jsp"><i class="icon-key"></i> 注销 </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown dropdown-extended quick-sidebar-toggler">
                        <span class="sr-only">Toggle Quick Sidebar</span> <i
                            class="icon-logout"></i>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END PAGE TOP -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <!-- BEGIN SIDEBAR MENU -->
            <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
            <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
            <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
            <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
            <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
            <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
            <ul class="page-sidebar-menu " data-keep-expanded="false"
                data-auto-scroll="true" data-slide-speed="200">
                <li class="start ">
                    <a href="index.jsp">
                        <i class="icon-home"></i>
                        <span class="title">主页</span>
                    </a>
                </li>
                <li>
                    <a href="futures_menu.jsp">
                        <i class="icon-graph"></i>
                        <span class="title">行情</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="icon-user"></i>
                        <span class="title">个人信息</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="users_money.jsp">资产管理</a>
                        </li>
                        <li>
                            <a href="users_order.jsp">订单管理</a>
                        </li>
                    </ul>
                </li>
                <li id="menu_admin">
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN PAGE HEAD -->
            <div class="page-head">
                <!-- BEGIN PAGE TITLE -->
                <div class="page-title">
                    <h1>
                        期货交易系统 <small>XM20-测试版</small>
                    </h1>
                </div>
                <!-- END PAGE TITLE -->
                <!-- BEGIN PAGE TOOLBAR -->
                <div class="page-toolbar">
                    <!-- BEGIN THEME PANEL -->
                    <div class="btn-group btn-theme-panel">
                        <a href="javascript:;" class="btn dropdown-toggle"
                           data-toggle="dropdown"> <i class="icon-settings"></i>
                        </a>
                        <div
                                class="dropdown-menu theme-panel pull-right dropdown-custom hold-on-click">
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <h3>THEME</h3>
                                    <ul class="theme-colors">
                                        <li class="theme-color theme-color-default"
                                            data-theme="default"><span class="theme-color-view"></span>
                                            <span class="theme-color-name">Dark Header</span></li>
                                        <li class="theme-color theme-color-light active"
                                            data-theme="light"><span class="theme-color-view"></span>
                                            <span class="theme-color-name">Light Header</span></li>
                                    </ul>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-12 seperator">
                                    <h3>LAYOUT</h3>
                                    <ul class="theme-settings">
                                        <li>Theme Style <select
                                                class="layout-style-option form-control input-small input-sm">
                                            <option value="square">Square corners</option>
                                            <option value="rounded" selected="selected">Rounded corners</option>
                                        </select>
                                        </li>
                                        <li>Layout <select
                                                class="layout-option form-control input-small input-sm">
                                            <option value="fluid" selected="selected">Fluid</option>
                                            <option value="boxed">Boxed</option>
                                        </select>
                                        </li>
                                        <li>Header <select
                                                class="page-header-option form-control input-small input-sm">
                                            <option value="fixed" selected="selected">Fixed</option>
                                            <option value="default">Default</option>
                                        </select>
                                        </li>
                                        <li>Top Dropdowns <select
                                                class="page-header-top-dropdown-style-option form-control input-small input-sm">
                                            <option value="light">Light</option>
                                            <option value="dark" selected="selected">Dark</option>
                                        </select>
                                        </li>
                                        <li>Sidebar Mode <select
                                                class="sidebar-option form-control input-small input-sm">
                                            <option value="fixed">Fixed</option>
                                            <option value="default" selected="selected">Default</option>
                                        </select>
                                        </li>
                                        <li>Sidebar Menu <select
                                                class="sidebar-menu-option form-control input-small input-sm">
                                            <option value="accordion" selected="selected">Accordion</option>
                                            <option value="hover">Hover</option>
                                        </select>
                                        </li>
                                        <li>Sidebar Position <select
                                                class="sidebar-pos-option form-control input-small input-sm">
                                            <option value="left" selected="selected">Left</option>
                                            <option value="right">Right</option>
                                        </select>
                                        </li>
                                        <li>Footer <select
                                                class="page-footer-option form-control input-small input-sm">
                                            <option value="fixed">Fixed</option>
                                            <option value="default" selected="selected">Default</option>
                                        </select>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END THEME PANEL -->
                </div>
                <!-- END PAGE TOOLBAR -->
            </div>
            <!-- END PAGE HEAD -->
            <!-- BEGIN PAGE BREADCRUMB -->
            <ul class="page-breadcrumb breadcrumb hide">
                <li><a href="javascript:;">Home</a><i class="fa fa-circle"></i>
                </li>
                <li class="active">Dashboard</li>
            </ul>
            <!-- END PAGE BREADCRUMB -->
            <!-- BEGIN PAGE CONTENT INNER -->
            <div class="row margin-top-10">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="dashboard-stat2">
                        <div class="display">
                            <div class="number">
                                <h3 class="font-green-sharp">
                                    7800<small class="font-green-sharp">$</small>
                                </h3>
                                <small>TOTAL PROFIT</small>
                            </div>
                            <div class="icon">
                                <i class="icon-pie-chart"></i>
                            </div>
                        </div>
                        <div class="progress-info">
                            <div class="progress">
									<span style="width: 76%;"
                                          class="progress-bar progress-bar-success green-sharp">
										<span class="sr-only">76% progress</span>
									</span>
                            </div>
                            <div class="status">
                                <div class="status-title">progress</div>
                                <div class="status-number">76%</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="dashboard-stat2">
                        <div class="display">
                            <div class="number">
                                <h3 class="font-red-haze">1349</h3>
                                <small>NEW FEEDBACKS</small>
                            </div>
                            <div class="icon">
                                <i class="icon-like"></i>
                            </div>
                        </div>
                        <div class="progress-info">
                            <div class="progress">
									<span style="width: 85%;"
                                          class="progress-bar progress-bar-success red-haze"> <span
                                            class="sr-only">85% change</span>
									</span>
                            </div>
                            <div class="status">
                                <div class="status-title">change</div>
                                <div class="status-number">85%</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="dashboard-stat2">
                        <div class="display">
                            <div class="number">
                                <h3 class="font-blue-sharp">567</h3>
                                <small>NEW ORDERS</small>
                            </div>
                            <div class="icon">
                                <i class="icon-basket"></i>
                            </div>
                        </div>
                        <div class="progress-info">
                            <div class="progress">
									<span style="width: 45%;"
                                          class="progress-bar progress-bar-success blue-sharp"> <span
                                            class="sr-only">45% grow</span>
									</span>
                            </div>
                            <div class="status">
                                <div class="status-title">grow</div>
                                <div class="status-number">45%</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="dashboard-stat2">
                        <div class="display">
                            <div class="number">
                                <h3 class="font-purple-soft">276</h3>
                                <small>NEW USERS</small>
                            </div>
                            <div class="icon">
                                <i class="icon-user"></i>
                            </div>
                        </div>
                        <div class="progress-info">
                            <div class="progress">
									<span style="width: 57%;"
                                          class="progress-bar progress-bar-success purple-soft">
										<span class="sr-only">56% change</span>
									</span>
                            </div>
                            <div class="status">
                                <div class="status-title">change</div>
                                <div class="status-number">57%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">k线图显示(右侧选择股票)</span>
                                <span class="caption-helper hide">weekly
										stats...</span>
                            </div>
                        </div>
                        <img id="k_img" src="/image/sh000001.gif"/>
                    </div>
                    <!-- END PORTLET-->
                </div>
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">行情信息</span>
                                        <span class="caption-helper hide">weekly
										stats...</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row number-stats margin-bottom-30"></div>
                            <ul class="nav nav-tabs nav-tabs-lg">
                                <li class="active">
                                    <a href="#SHA" data-toggle="tab">上指</a>
                                </li>
                                <li>
                                    <a href="#SZA" data-toggle="tab">深指</a>
                                </li>
                                <li>
                                    <a href="#tab_3" data-toggle="tab">创业板</a>
                                </li>
                                <li>
                                    <a href="#tab_3" data-toggle="tab">大盘指数</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                            <div id="SHA" class="table-scrollable table-scrollable-borderless tab-pane active">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th>代码</th>
                                        <th>名称</th>
                                        <th>今日开盘价</th>
                                        <th>昨日收盘价</th>
                                        <th>当前价</th>
                                        <th>今日最高价</th>
                                        <th>今日最低价</th>
                                        <th>K线图信息</th>
                                    </tr>
                                    <%
                                        request.setCharacterEncoding("UTF-8");
                                        int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));


                                        int pageSize = 15;
                                        int totalPage = 0;
                                        totalPage = pg.getTotalPage(pageSize);

                                        int prePage = start - 1 >= 0 ? start - 1 : start + 1;
                                        int nextPage = start + 1 < totalPage ? start + 1 : totalPage - 1;
                                        request.setAttribute("totalPage", totalPage);
                                        request.setAttribute("prePage", prePage);
                                        request.setAttribute("nextPage", nextPage);
                                        Page pg2 = new Page(start, pageSize);
                                        List<gp> currentGp1 = (List<gp>) gp.queryGpByPage(pg2, "SZA");
                                        //List<gp> currentGp = (List<gp>) request.getAttribute("gpList");
                                        for (gp u : currentGp1) {
                                    %>
                                    <tr role="row" class="filter">
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_id()%>">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_name()%>">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_price_today()%>">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_price_current()%>">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_price_MAX()%>">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" readonly=“readonly” value="<%=u.getgp_price_MIN()%>">
                                        </td>
                                        <td>
                                            <button onclick="window.location.href = 'buy.jsp?gp_id=<%=u.getgp_id()%>&gp_name=<%=u.getgp_name()%>&gp_price=<%=u.getgp_price_current()%>'">开仓</button>
                                            <button onclick="window.open('http://image.sinajs.cn/newchart/daily/n/<%=u.getgp_id()%>.gif')">K线图</button>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </thead>
                                </table>
                                <nav>
                                    <ul class="pagination">
                                        <li><a href="index.jsp?start=0"> <span>首页</span>
                                        </a></li>
                                        <li><a href="index.jsp?start=${requestScope.prePage }">
                                            <span>上一页</span>
                                        </a></li>
                                        <li><a href="index.jsp?start=${requestScope.nextPage }">
                                            <span>下一页</span>
                                        </a></li>
                                        <li><a
                                                href="index.jsp?start=${requestScope.totalPage-1} "> <span>尾页</span>
                                        </a></li>
                                    </ul>
                                </nav>
                            </div>
                                <div id="SZA" class="table-scrollable table-scrollable-borderless tab-pane">
                                    <table class="table table-hover table-light">
                                        <thead>
                                        <tr class="uppercase">
                                            <th>代码</th>
                                            <th>名称</th>
                                            <th>今日开盘价</th>
                                            <th>昨日收盘价</th>
                                            <th>当前价</th>
                                            <th>今日最高价</th>
                                            <th>今日最低价</th>
                                            <th>K线图信息</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <nav>
                                        <ul class="pagination">
                                            <li><a href="index.jsp?start=0"> <span>首页</span>
                                            </a></li>
                                            <li><a href="index.jsp?start=${requestScope.prePage }">
                                                <span>上一页</span>
                                            </a></li>
                                            <li><a href="index.jsp?start=${requestScope.nextPage }">
                                                <span>下一页</span>
                                            </a></li>
                                            <li><a
                                                    href="index.jsp?start=${requestScope.totalPage-1} "> <span>尾页</span>
                                            </a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light tasks-widget">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">天气</span>
                                <span class="caption-helper">地点</span>
                            </div>
                            <div class="inputs">
                                <div class="portlet-input input-small input-inline">
                                    <div class="input-icon right">
                                        <i class="icon-magnifier"></i>
                                        <input type="text" class="form-control form-control-solid" placeholder="这个框可以搜索城市天气">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="task-content">
                                <div class="scroller" style="height: 282px;"
                                     data-always-visible="1" data-rail-visible1="0"
                                     data-handle-color="#D7DCE2">
                                    <!-- START TASK LIST -->
                                    <ul class="task-list">
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="hidden" value="1" name="test"/> <input
                                                    type="checkbox" class="liChild" value="2" name="test"/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Present 2013 Year IPO
														Statistics at Board Meeting </span> <span
                                                    class="label label-sm label-success">Company</span> <span
                                                    class="task-bell"> <i class="fa fa-bell-o"></i>
													</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Hold An Interview for
														Marketing Manager Position </span> <span
                                                    class="label label-sm label-danger">Marketing</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> AirAsia Intranet System
														Project Internal Meeting </span> <span
                                                    class="label label-sm label-success">AirAsia</span> <span
                                                    class="task-bell"> <i class="fa fa-bell-o"></i>
													</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Technical Management
														Meeting </span> <span class="label label-sm label-warning">Company</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Kick-off Company CRM
														Mobile App Development </span> <span
                                                    class="label label-sm label-info">Internal Products</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Prepare Commercial
														Offer For SmartVision Website Rewamp </span> <span
                                                    class="label label-sm label-danger">SmartVision</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> Sign-Off The Comercial
														Agreement With AutoSmart </span> <span
                                                    class="label label-sm label-default">AutoSmart</span> <span
                                                    class="task-bell"> <i class="fa fa-bell-o"></i>
													</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
                                                <span class="task-title-sp"> Company Staff Meeting </span>
                                                <span class="label label-sm label-success">Cruise</span> <span
                                                    class="task-bell"> <i class="fa fa-bell-o"></i>
													</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="last-line">
                                            <div class="task-checkbox">
                                                <input type="checkbox" class="liChild" value=""/>
                                            </div>
                                            <div class="task-title">
													<span class="task-title-sp"> KeenThemes Investment
														Discussion </span> <span class="label label-sm label-warning">KeenThemes
													</span>
                                            </div>
                                            <div class="task-config">
                                                <div class="task-config-btn btn-group">
                                                    <a class="btn btn-xs default" href="javascript:;"
                                                       data-toggle="dropdown" data-hover="dropdown"
                                                       data-close-others="true"> <i class="fa fa-cog"></i><i
                                                            class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-check"></i> Complete
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-pencil"></i> Edit
                                                        </a></li>
                                                        <li><a href="javascript:;"> <i
                                                                class="fa fa-trash-o"></i> Cancel
                                                        </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <!-- END START TASK LIST -->
                                </div>
                            </div>
                            <div class="task-footer">
                                <div class="btn-arrow-link pull-right">
                                    <a href="javascript:;">See All Tasks</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
                <div class="col-md-6 col-sm-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">财经新闻</span>
                                <span class="caption-helper">显示新闻数</span>
                            </div>
                            <div class="inputs">
                                <div class="portlet-input input-inline input-small ">
                                    <div class="input-icon right">
                                        <i class="icon-magnifier"></i>
                                        <input type="text" class="form-control form-control-solid" placeholder="search...">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="scroller" style="height: 305px;"
                                 data-always-visible="1" data-rail-visible1="0"
                                 data-handle-color="#D7DCE2">
                                <div class="general-item-list">
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar4.jpg"> <a
                                                    href="" class="item-name primary-link">Nick Larson</a> <span
                                                    class="item-label">3 hrs ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-success"></span> Open</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet,
                                            consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                            tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar3.jpg"> <a
                                                    href="" class="item-name primary-link">Mark</a> <span
                                                    class="item-label">5 hrs ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-warning"></span> Pending</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet,
                                            consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                            tincidunt ut laoreet dolore magna aliquam erat volutpat
                                            tincidunt ut laoreet.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar6.jpg"> <a
                                                    href="" class="item-name primary-link">Nick Larson</a> <span
                                                    class="item-label">8 hrs ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-primary"></span> Closed</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet,
                                            consectetuer adipiscing elit, sed diam nonummy nibh.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar7.jpg"> <a
                                                    href="" class="item-name primary-link">Nick Larson</a> <span
                                                    class="item-label">12 hrs ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-danger"></span> Pending</span>
                                        </div>
                                        <div class="item-body">Consectetuer adipiscing elit
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                                            sed diam nonummy nibh euismod tincidunt ut laoreet dolore
                                            magna aliquam erat volutpat.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar9.jpg"> <a
                                                    href="" class="item-name primary-link">Richard Stone</a> <span
                                                    class="item-label">2 days ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-danger"></span> Open</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet,
                                            consectetuer adipiscing elit, ut laoreet dolore magna
                                            aliquam erat volutpat.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar8.jpg"> <a
                                                    href="" class="item-name primary-link">Dan</a> <span
                                                    class="item-label">3 days ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-warning"></span> Pending</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet, sed
                                            diam nonummy nibh euismod tincidunt ut laoreet dolore magna
                                            aliquam erat volutpat.
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-head">
                                            <div class="item-details">
                                                <img class="item-pic"
                                                     src="assets/admin/layout3/img/avatar2.jpg"> <a
                                                    href="" class="item-name primary-link">Larry</a> <span
                                                    class="item-label">4 hrs ago</span>
                                            </div>
                                            <span class="item-status"><span
                                                    class="badge badge-empty badge-success"></span> Open</span>
                                        </div>
                                        <div class="item-body">Lorem ipsum dolor sit amet,
                                            consectetuer adipiscing elit, sed diam nonummy nibh euismod
                                            tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN REGIONAL STATS PORTLET-->
                    <div class="portlet light ">
                        <div class="portlet-title">
                            <div class="caption caption-md">
                                <i class="icon-bar-chart theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">Regional
										Stats</span>
                            </div>
                            <div class="actions">
                                <a class="btn btn-circle btn-icon-only btn-default"
                                   href="javascript:;"> <i class="icon-cloud-upload"></i>
                                </a> <a class="btn btn-circle btn-icon-only btn-default"
                                        href="javascript:;"> <i class="icon-wrench"></i>
                            </a> <a class="btn btn-circle btn-icon-only btn-default fullscreen"
                                    href="javascript:;"> </a> <a
                                    class="btn btn-circle btn-icon-only btn-default"
                                    href="javascript:;"> <i class="icon-trash"></i>
                            </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="region_statistics_loading">
                                <img src="assets/admin/layout/img/loading.gif" alt="loading"/>
                            </div>
                            <div id="region_statistics_content" class="display-none">
                                <div class="btn-toolbar margin-bottom-10">
                                    <div class="btn-group btn-group-circle" data-toggle="buttons">
                                        <a href="" class="btn grey-salsa btn-sm active"> Users </a> <a
                                            href="" class="btn grey-salsa btn-sm"> Orders </a>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <a href=""
                                           class="btn btn-circle grey-salsa btn-sm dropdown-toggle"
                                           data-toggle="dropdown" data-hover="dropdown"
                                           data-close-others="true"> Select Region <span
                                                class="fa fa-angle-down"> </span>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li><a href="javascript:;" id="regional_stat_world">
                                                World </a></li>
                                            <li><a href="javascript:;" id="regional_stat_usa">
                                                USA </a></li>
                                            <li><a href="javascript:;" id="regional_stat_europe">
                                                Europe </a></li>
                                            <li><a href="javascript:;" id="regional_stat_russia">
                                                Russia </a></li>
                                            <li><a href="javascript:;" id="regional_stat_germany">
                                                Germany </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="vmap_world" class="vmaps display-none"></div>
                                <div id="vmap_usa" class="vmaps display-none"></div>
                                <div id="vmap_europe" class="vmaps display-none"></div>
                                <div id="vmap_russia" class="vmaps display-none"></div>
                                <div id="vmap_germany" class="vmaps display-none"></div>
                            </div>
                        </div>
                    </div>
                    <!-- END REGIONAL STATS PORTLET-->
                </div>
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font-color hide"></i> <span
                                    class="caption-subject theme-font-color bold uppercase">Feeds</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_1_1" data-toggle="tab">
                                    System </a></li>
                                <li><a href="#tab_1_2" data-toggle="tab"> Activities </a>
                                </li>
                            </ul>
                        </div>
                        <div class="portlet-body">
                            <!--BEGIN TABS-->
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1_1">
                                    <div class="scroller" style="height: 337px;"
                                         data-always-visible="1" data-rail-visible1="0"
                                         data-handle-color="#D7DCE2">
                                        <ul class="feeds">
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                You have 4 pending tasks. <span
                                                                    class="label label-sm label-info"> Take action
																		<i class="fa fa-share"></i>
																	</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New version v1.4 just lunched!
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">20 mins</div>
                                                </div>
                                            </a></li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-danger">
                                                                <i class="fa fa-bolt"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Database server #12 overloaded.
                                                                Please fix the issue.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">24 mins</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New order received and pending
                                                                for process.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">30 mins</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New payment refund and pending
                                                                approval.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">40 mins</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-warning">
                                                                <i class="fa fa-plus"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New member registered. Pending
                                                                approval.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">1.5 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                Web server hardware needs to be upgraded. <span
                                                                    class="label label-sm label-default "> Overdue
																	</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">2 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-default">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Prod01 database server is
                                                                overloaded 90%.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">3 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-warning">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New group created. Pending
                                                                manager review.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">5 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Order payment failed.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">18 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-default">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New application received.</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">21 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Dev90 web server restarted.
                                                                Pending overall system check.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">22 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-default">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New member registered. Pending
                                                                approval
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">21 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">L45 Network failure. Schedule
                                                                maintenance.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">22 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-default">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Order canceled with failed
                                                                payment.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">21 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Web-A2 clound instance created.
                                                                Schedule full scan.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">22 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-default">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">Member canceled. Schedule
                                                                account review.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">21 hours</div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-info">
                                                                <i class="fa fa-bullhorn"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New order received. Please take
                                                                care of it.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">22 hours</div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_1_2">
                                    <div class="scroller" style="height: 337px;"
                                         data-always-visible="1" data-rail-visible1="0"
                                         data-handle-color="#D7DCE2">
                                        <ul class="feeds">
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New order received</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">10 mins</div>
                                                </div>
                                            </a></li>
                                            <li>
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-danger">
                                                                <i class="fa fa-bolt"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">
                                                                Order #24DOP4 has been rejected. <span
                                                                    class="label label-sm label-danger "> Take
																		action <i class="fa fa-share"></i>
																	</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">24 mins</div>
                                                </div>
                                            </li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                            <li><a href="javascript:;">
                                                <div class="col1">
                                                    <div class="cont">
                                                        <div class="cont-col1">
                                                            <div class="label label-sm label-success">
                                                                <i class="fa fa-bell-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="cont-col2">
                                                            <div class="desc">New user registered</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col2">
                                                    <div class="date">Just now</div>
                                                </div>
                                            </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
            </div>
            <!-- END PAGE CONTENT INNER -->

            <!-- BEGIN QUICK SIDEBAR -->
            <a href="javascript:;" class="page-quick-sidebar-toggler"><i
                    class="icon-login"></i></a>
            <div class="page-quick-sidebar-wrapper">
                <div class="page-quick-sidebar">
                    <div class="nav-justified">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active"><a href="#quick_sidebar_tab_1"
                                                  data-toggle="tab"> Users <span class="badge badge-danger">2</span>
                            </a></li>
                            <li><a href="#quick_sidebar_tab_2" data-toggle="tab">
                                Alerts <span class="badge badge-success">7</span>
                            </a></li>
                            <li class="dropdown"><a href="javascript:;"
                                                    class="dropdown-toggle" data-toggle="dropdown"> More<i
                                    class="fa fa-angle-down"></i>
                            </a>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="#quick_sidebar_tab_3" data-toggle="tab">
                                        <i class="icon-bell"></i> Alerts
                                    </a></li>
                                    <li><a href="#quick_sidebar_tab_3" data-toggle="tab">
                                        <i class="icon-info"></i> Notifications
                                    </a></li>
                                    <li><a href="#quick_sidebar_tab_3" data-toggle="tab">
                                        <i class="icon-speech"></i> Activities
                                    </a></li>
                                    <li class="divider"></li>
                                    <li><a href="#quick_sidebar_tab_3" data-toggle="tab">
                                        <i class="icon-settings"></i> Settings
                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active page-quick-sidebar-chat"
                                 id="quick_sidebar_tab_1">
                                <div class="page-quick-sidebar-chat-users"
                                     data-rail-color="#ddd"
                                     data-wrapper-class="page-quick-sidebar-list">
                                    <h3 class="list-heading">Staff</h3>
                                    <ul class="media-list list-items">
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="badge badge-success">8</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar3.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Bob Nilson</h4>
                                                <div class="media-heading-sub">Project Manager</div>
                                            </div>
                                        </li>
                                        <li class="media"><img class="media-object"
                                                               src="assets/admin/layout/img/avatar1.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Nick Larson</h4>
                                                <div class="media-heading-sub">Art Director</div>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="badge badge-danger">3</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar4.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Deon Hubert</h4>
                                                <div class="media-heading-sub">CTO</div>
                                            </div>
                                        </li>
                                        <li class="media"><img class="media-object"
                                                               src="assets/admin/layout/img/avatar2.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Ella Wong</h4>
                                                <div class="media-heading-sub">CEO</div>
                                            </div>
                                        </li>
                                    </ul>
                                    <h3 class="list-heading">Customers</h3>
                                    <ul class="media-list list-items">
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="badge badge-warning">2</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar6.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Lara Kunis</h4>
                                                <div class="media-heading-sub">CEO, Loop Inc</div>
                                                <div class="media-heading-small">Last seen 03:10 AM</div>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="label label-sm label-success">new</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar7.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Ernie Kyllonen</h4>
                                                <div class="media-heading-sub">
                                                    Project Manager,<br> SmartBizz PTL
                                                </div>
                                            </div>
                                        </li>
                                        <li class="media"><img class="media-object"
                                                               src="assets/admin/layout/img/avatar8.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Lisa Stone</h4>
                                                <div class="media-heading-sub">CTO, Keort Inc</div>
                                                <div class="media-heading-small">Last seen 13:10 PM</div>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="badge badge-success">7</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar9.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Deon Portalatin</h4>
                                                <div class="media-heading-sub">CFO, H&D LTD</div>
                                            </div>
                                        </li>
                                        <li class="media"><img class="media-object"
                                                               src="assets/admin/layout/img/avatar10.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Irina Savikova</h4>
                                                <div class="media-heading-sub">CEO, Tizda Motors Inc
                                                </div>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="media-status">
                                                <span class="badge badge-danger">4</span>
                                            </div>
                                            <img class="media-object"
                                                 src="assets/admin/layout/img/avatar11.jpg" alt="...">
                                            <div class="media-body">
                                                <h4 class="media-heading">Maria Gomez</h4>
                                                <div class="media-heading-sub">Manager, Infomatic Inc
                                                </div>
                                                <div class="media-heading-small">Last seen 03:10 AM</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="page-quick-sidebar-item">
                                    <div class="page-quick-sidebar-chat-user">
                                        <div class="page-quick-sidebar-nav">
                                            <a href="javascript:;"
                                               class="page-quick-sidebar-back-to-list"><i
                                                    class="icon-arrow-left"></i>Back</a>
                                        </div>
                                        <div class="page-quick-sidebar-chat-user-messages">
                                            <div class="post out">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar3.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Bob Nilson</a> <span
                                                        class="datetime">20:15</span>
                                                    <span class="body"> When could you send me the
															report ? </span>
                                                </div>
                                            </div>
                                            <div class="post in">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar2.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Ella Wong</a> <span
                                                        class="datetime">20:15</span>
                                                    <span class="body"> Its almost done. I will be
															sending it shortly </span>
                                                </div>
                                            </div>
                                            <div class="post out">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar3.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Bob Nilson</a> <span
                                                        class="datetime">20:15</span>
                                                    <span class="body"> Alright. Thanks! :) </span>
                                                </div>
                                            </div>
                                            <div class="post in">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar2.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Ella Wong</a> <span
                                                        class="datetime">20:16</span>
                                                    <span class="body"> You are most welcome. Sorry for
															the delay. </span>
                                                </div>
                                            </div>
                                            <div class="post out">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar3.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Bob Nilson</a> <span
                                                        class="datetime">20:17</span>
                                                    <span class="body"> No probs. Just take your time
															:) </span>
                                                </div>
                                            </div>
                                            <div class="post in">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar2.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Ella Wong</a> <span
                                                        class="datetime">20:40</span>
                                                    <span class="body"> Alright. I just emailed it to
															you. </span>
                                                </div>
                                            </div>
                                            <div class="post out">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar3.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Bob Nilson</a> <span
                                                        class="datetime">20:17</span>
                                                    <span class="body"> Great! Thanks. Will check it
															right away. </span>
                                                </div>
                                            </div>
                                            <div class="post in">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar2.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Ella Wong</a> <span
                                                        class="datetime">20:40</span>
                                                    <span class="body"> Please let me know if you have
															any comment. </span>
                                                </div>
                                            </div>
                                            <div class="post out">
                                                <img class="avatar" alt=""
                                                     src="assets/admin/layout/img/avatar3.jpg"/>
                                                <div class="message">
                                                    <span class="arrow"></span> <a href="javascript:;"
                                                                                   class="name">Bob Nilson</a> <span
                                                        class="datetime">20:17</span>
                                                    <span class="body"> Sure. I will check and buzz you
															if anything needs to be corrected. </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="page-quick-sidebar-chat-user-form">
                                            <div class="input-group">
                                                <input type="text" class="form-control"
                                                       placeholder="Type a message here...">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn blue">
                                                        <i class="icon-paper-clip"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane page-quick-sidebar-alerts"
                                 id="quick_sidebar_tab_2">
                                <div class="page-quick-sidebar-alerts-list">
                                    <h3 class="list-heading">General</h3>
                                    <ul class="feeds list-items">
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-info">
                                                            <i class="fa fa-shopping-cart"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">
                                                            New order received with <span
                                                                class="label label-sm label-danger"> Reference
																	Number: DR23923 </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">30 mins</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-success">
                                                            <i class="fa fa-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">You have 5 pending membership
                                                            that requires a quick review.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">24 mins</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-danger">
                                                            <i class="fa fa-bell-o"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">
                                                            Web server hardware needs to be upgraded. <span
                                                                class="label label-sm label-warning"> Overdue </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">2 hours</div>
                                            </div>
                                        </li>
                                        <li><a href="javascript:;">
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-default">
                                                            <i class="fa fa-briefcase"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">IPO Report for year 2013 has
                                                            been released.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">20 mins</div>
                                            </div>
                                        </a></li>
                                    </ul>
                                    <h3 class="list-heading">System</h3>
                                    <ul class="feeds list-items">
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-info">
                                                            <i class="fa fa-shopping-cart"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">
                                                            New order received with <span
                                                                class="label label-sm label-success"> Reference
																	Number: DR23923 </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">30 mins</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-success">
                                                            <i class="fa fa-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">You have 5 pending membership
                                                            that requires a quick review.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">24 mins</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-warning">
                                                            <i class="fa fa-bell-o"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">
                                                            Web server hardware needs to be upgraded. <span
                                                                class="label label-sm label-default "> Overdue </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">2 hours</div>
                                            </div>
                                        </li>
                                        <li><a href="javascript:;">
                                            <div class="col1">
                                                <div class="cont">
                                                    <div class="cont-col1">
                                                        <div class="label label-sm label-info">
                                                            <i class="fa fa-briefcase"></i>
                                                        </div>
                                                    </div>
                                                    <div class="cont-col2">
                                                        <div class="desc">IPO Report for year 2013 has
                                                            been released.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col2">
                                                <div class="date">20 mins</div>
                                            </div>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane page-quick-sidebar-settings"
                                 id="quick_sidebar_tab_3">
                                <div class="page-quick-sidebar-settings-list">
                                    <h3 class="list-heading">General Settings</h3>
                                    <ul class="list-items borderless">
                                        <li>Enable Notifications <input type="checkbox"
                                                                        class="make-switch" checked data-size="small"
                                                                        data-on-color="success" data-on-text="ON"
                                                                        data-off-color="default" data-off-text="OFF">
                                        </li>
                                        <li>Allow Tracking <input type="checkbox"
                                                                  class="make-switch" data-size="small"
                                                                  data-on-color="info"
                                                                  data-on-text="ON" data-off-color="default"
                                                                  data-off-text="OFF">
                                        </li>
                                        <li>Log Errors <input type="checkbox"
                                                              class="make-switch" checked data-size="small"
                                                              data-on-color="danger" data-on-text="ON"
                                                              data-off-color="default" data-off-text="OFF">
                                        </li>
                                        <li>Auto Sumbit Issues <input type="checkbox"
                                                                      class="make-switch" data-size="small"
                                                                      data-on-color="warning" data-on-text="ON"
                                                                      data-off-color="default" data-off-text="OFF">
                                        </li>
                                        <li>Enable SMS Alerts <input type="checkbox"
                                                                     class="make-switch" checked data-size="small"
                                                                     data-on-color="success" data-on-text="ON"
                                                                     data-off-color="default" data-off-text="OFF">
                                        </li>
                                    </ul>
                                    <h3 class="list-heading">System Settings</h3>
                                    <ul class="list-items borderless">
                                        <li>Security Level <select
                                                class="form-control input-inline input-sm input-small">
                                            <option value="1">Normal</option>
                                            <option value="2" selected>Medium</option>
                                            <option value="e">High</option>
                                        </select>
                                        </li>
                                        <li>Failed Email Attempts <input
                                                class="form-control input-inline input-sm input-small"
                                                value="5"/>
                                        </li>
                                        <li>Secondary SMTP Port <input
                                                class="form-control input-inline input-sm input-small"
                                                value="3560"/>
                                        </li>
                                        <li>Notify On System Error <input type="checkbox"
                                                                          class="make-switch" checked data-size="small"
                                                                          data-on-color="danger" data-on-text="ON"
                                                                          data-off-color="default" data-off-text="OFF">
                                        </li>
                                        <li>Notify On SMTP Error <input type="checkbox"
                                                                        class="make-switch" checked data-size="small"
                                                                        data-on-color="warning" data-on-text="ON"
                                                                        data-off-color="default" data-off-text="OFF">
                                        </li>
                                    </ul>
                                    <div class="inner-content">
                                        <button class="btn btn-success">
                                            <i class="icon-settings"></i> Save Changes
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END QUICK SIDEBAR -->
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <div class="page-footer-inner">
        2014 &copy; Metronic by keenthemes. <a
            href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes"
            title="Purchase Metronic just for 27$ and get lifetime updates for free"
            target="_blank">Purchase Metronic!</a>
    </div>
    <div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
    </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->
<script src="assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout2/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/index3.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<script src="js/global/initializePage.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script src="js/index.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core componets
        Layout.init(); // init layout
        Demo.init(); // init demo features
        QuickSidebar.init(); // init quick sidebar
        Index.init(); // init index page
        Tasks.initDashboardWidget(); // init tash dashboard widget
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>