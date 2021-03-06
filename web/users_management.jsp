<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2020/11/8
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2020/11/8
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java"
        import="java.util.*,java.sql.*,tools.entity.*,tools.dao.*,tools.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<%@ page import="tools.util.JDBCUtil" %>
<jsp:useBean id="usershow" scope="page" class="tools.daoimpl.usershowImpl"/>
<jsp:useBean id="pg" scope="page" class="tools.daoimpl.PageDaoImpl"/>
<jsp:useBean id="user" scope="page" class="tools.daoimpl.UserDAOImpl"/>
<%
    //判断是否未登录，用的session判断，可用filter，之后再说
    String name=(String)session.getAttribute("loginUsername");
    String authority=(String)session.getAttribute("Authority");
    if(name==null){
        response.sendRedirect("LoginAndRegister.jsp");
    }
%>

<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 4.1.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>期货交易系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="assets/admin/layout4/css/themes/light.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
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
<body class="page-header-fixed page-sidebar-closed-hide-logo " onload="initPage('<%=authority%>','<%=name%>')">
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
        <!-- END PAGE ACTIONS -->
        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <!-- BEGIN HEADER SEARCH BOX -->
            <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
            <!-- END HEADER SEARCH BOX -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="separator hide"></li>
                    <!-- BEGIN NOTIFICATION DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
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
                            <li><a href="users_money.jsp"> <i class="icon-user"></i>
                                我的余额
                            </a></li>
                            <li><a href="users_order.jsp"> <i class="icon-envelope-open"></i>
                                我的订单
                            </a></li>
                            <li><a href="users_information.jsp"> <i class="icon-envelope-open"></i>
                                我的信息
                            </a></li>
                            <li class="divider"></li>
                            <li>
                                <a href="LoginAndRegister.jsp"><i class="icon-key"></i> 注销 </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown dropdown-extended quick-sidebar-toggler">
                        <span class="sr-only">Toggle Quick Sidebar</span>
                        <i onclick="window.location.href='LoginAndRegister.jsp'" class="icon-logout"></i>
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
<div class="clearfix">
</div>
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
            <ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
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
                        <%--					<span class="arrow"></span>--%>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">
                        <i class="icon-user"></i>
                        <span class="title">个人信息</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="users_information.jsp">个人信息</a>
                        </li>
                        <li>
                            <a href="users_money.jsp">资产管理</a>
                        </li>
                        <li>
                            <a href="users_order.jsp">订单管理</a>
                        </li>
                        <li>
                            <a href="users_order_history.jsp">历史订单管理</a>
                        </li>
                    </ul>
                </li>
                <li>
                <li class="active open">
                    <a href="javascript:;"> <i class="icon-users"></i>
                        <span class="title">后台管理</span>
                        <span class="arrow open"></span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="users_management.jsp">用户管理</a></li>
                        <li><a href="buy_management.jsp">订单管理</a></li>
                        <li><a href="buy_management_history.jsp">历史订单管理</a></li>
                    </ul>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            Widget settings form goes here
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn blue">Save changes</button>
                            <button type="button" class="btn default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE HEAD -->
            <div class="page-head">
                <div class="page-title">
                    <h1>用户管理 <small>用户信息列表</small></h1>
                </div>
            </div>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <a href="index.jsp">主页</a>
                    <i class="fa fa-circle"></i>
                </li>
                <li>
                    <a href="#">后台管理</a>
                    <i class="fa fa-circle"></i>
                </li>
                <li>
                    <a href="#">用户管理</a>
                </li>
            </ul>
                <!-- END PAGE TITLE -->
            <div class="portlet light ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-basket font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">用户信息列表</span>
                        <span class="caption-helper"></span>
                    </div>
                    <div class="actions">
                        <div class="btn-group">
                            <a class="btn btn-default btn-circle" href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-share"></i>
                                <span class="hidden-480">工具 </span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:;" onclick="window.open('exportExcel1.jsp')">导出到excel </a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="javascript:;" id="usersManagement" onclick="jumpToPrint(id)">打印 </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row number-stats margin-bottom-30"></div>
                    <div class="table-scrollable table-scrollable-borderless">
                        <table class="table table-hover table-light">
                            <thead>
                            <%
                                // TODO 用户管理翻页异常，建议修改bug
                            %>
                            <tr class="uppercase">
                                <th>用户id</th>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>角色</th>
                                <th>创建时间</th>
                                <th>余额</th>
                                <th>操作</th>
                            </tr>
                            </thead>
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
                                Page pg1 = new Page(start, pageSize);
                                List<usershow> currentUsershow = (List<usershow>) usershow.queryUsershowByPage(pg1);
                                //List<gp> currentGp = (List<gp>) request.getAttribute("gpList");
                                for (usershow u : currentUsershow) {
                            %>
                            <tr>
                                <td><input type="text" id="<%="update_userID"+u.getshow_userid()%>" class="form-control form-filter input-sm" readonly="readonly" value="<%=u.getshow_userid()%>"/>
                                </td>
                                <td><input type="text" id="<%="update_user_name"+u.getshow_userid()%>" class="form-control form-filter input-sm" value="<%=u.getshow_username()%>"/>
                                </td>
                                <td><input type="text" id="<%="update_user_password"+u.getshow_userid()%>" class="form-control form-filter input-sm" value="<%=u.getshow_password()%>"/>
                                </td>
                                <td><input type="text" id="<%="update_user_authority"+u.getshow_userid()%>" readonly="readonly" class="form-control form-filter input-sm" value="<%=u.getshow_authority()%>"/>
                                </td>
                                <td><input type="text" id="<%="update_user_createTime"+u.getshow_userid()%>" readonly="readonly" class="form-control form-filter input-sm" value="<%=u.getshow_createTime()%>"/>
                                </td>
                                <td><input type="text" id="<%="update_user_money"+u.getshow_userid()%>" readonly="readonly" class="form-control form-filter input-sm" value="<%=u.getshow_money()%>"/>
                                </td>
                                <td>
                                    <button class="btn btn-success uppercase" onclick="deleteUser('<%=u.getshow_userid()%>')">删除用户</button>
                                </td>

                                <td>
                                    <button class="btn btn-success uppercase" onclick="updateUser('<%=u.getshow_userid()%>')">更改信息</button>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </table>
                        <nav>
                            <ul class="pagination">
                                <li><a href="users_management.jsp?start=0"> <span>首页</span>
                                </a></li>
                                <li><a href="users_management.jsp?start=${requestScope.prePage }">
                                    <span>上一页</span>
                                </a></li>
                                <li><a href="users_management.jsp?start=${requestScope.nextPage }">
                                    <span>下一页</span>
                                </a></li>
                                <li><a
                                        href="users_management.jsp?start=${requestScope.totalPage-1} "> <span>尾页</span>
                                </a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- END PAGE HEAD -->
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->

            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <div class="page-footer-inner">
        2020 &copy; XM20期货交易系统
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
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>
<script src="assets/global/scripts/datatable.js"></script>
<script src="assets/admin/pages/scripts/ecommerce-orders.js"></script>
<script src="js/global/initializePage.js" type="text/javascript"></script>
<script src="js/global/Printing.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        EcommerceOrders.init();
    });

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
<script type="text/javascript">
    function deleteUser(user_id){
        jQuery.ajax({
            url:'delete_user',
            data:{
                "user_id": user_id,
            },
            type:'post',
            data_type:'json',
            global:false,
            success:function (message){
                alert(message.msg);
                window.location.href="users_management.jsp";
            },
            error:function (){
                console.log("提交失败");
            }
        });
    }

    function updateUser(user_id){

        var username ='#update_user_name'+user_id;
        var userpassword = '#update_user_password'+user_id;
        var userauthority = '#update_user_authority'+user_id;
        jQuery.ajax({
            url:'update_user',
            data:{
                "user_id":user_id,
                "username":jQuery(username).val(),
                "password":jQuery(userpassword).val(),
                "authority":jQuery(userauthority).val(),
            },
            type:'post',
            data_type:'json',
            global:false,
            success:function (message){
                alert(message.msg);
                window.location.href="users_management.jsp";
            },
            error:function (){
                console.log("提交失败");
            }
        });
    }
</script>
