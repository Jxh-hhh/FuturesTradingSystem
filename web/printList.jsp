<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2020/11/8
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java"
        import="java.util.*,java.sql.*,deal.entity.*,deal.dao.*,deal.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="order" scope="page" class="deal.daoimpl.orderImpl"/>
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
<style media="print">
    .pagination{display: none}
</style>
<body class="page-header-fixed page-sidebar-closed-hide-logo " onload="showPage()">
<!-- BEGIN HEADER -->
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->


    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

            <!-- /.modal -->
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE HEAD -->

                <div class="portlet-body">
                    <div class="row number-stats margin-bottom-30"></div>
                    <div class="table-scrollable table-scrollable-borderless">
                        <nav>
                            <ul class="pagination">
                                <%--                                <li id="Printing"><a> <span>打印</span>--%>
                                <%--                                </a></li>--%>
                                <button id="pr">打印</button>
                            </ul>
                        </nav>
                        <table class="table table-hover table-light" id="toBePrinted">




                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>

    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner">
            2014 &copy; Metronic by keenthemes. <a href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">Purchase Metronic!</a>
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
    <!-- END PAGE LEVEL SCRIPTS -->
    <script src="js/global/initializePage.js" type="text/javascript"></script>
    <script src="js/buy_management.js" type="text/javascript"></script>
    <script src="js/global/Printing.js" type="text/javascript"></script>

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
<script src="js/global/Printing.js"></script>
<script>
    function getID(){
        var id = window.location.search.substring(1);
        var temp='',jd=false;
        for(var i = 0;i < id.length; i++){
            if(jd == true){
                temp+=id[i];
            }
            if(id[i] == '=')jd=true;
        }
        return temp;
    }
    function showPage(){

        var id = window.location.search.substring(1);
        var temp='',jd=false;
        for(var i = 0;i < id.length; i++){
            if(jd == true){
                temp+=id[i];
            }
            if(id[i] == '=')jd=true;
        }
        console.log(temp);
        id=temp;
        //var id = getID();
        var html="";

        if(id=="buyManagement"){
            console.log(id);
            html+="<thead>\n" +
                "                            <tr class=\"uppercase\">\n" +
                "                                <th>订单号</th>\n" +
                "                                <th>期货编号</th>\n" +
                "                                <th>开仓价</th>\n" +
                "                                <th>最新价</th>\n" +
                "                                <th>创建时间</th>\n" +
                "                                <th>数量</th>\n" +
                "                                <th>操作</th>\n" +
                "                            </tr>\n" +
                "                            </thead>";
            <%
                request.setCharacterEncoding("UTF-8");
                int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
                int pageSize = 99999999;
                int totalPage = 0;
                totalPage = pg.getTotalPage(pageSize);
                int prePage = start - 1 >= 0 ? start - 1 : start + 1;
                int nextPage = start + 1 < totalPage ? start + 1 : totalPage - 1;
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("prePage", prePage);
                request.setAttribute("nextPage", nextPage);
                Page pg1 = new Page(start, pageSize);
                List<order> currentOrder = (List<order>) order.queryOrderByPage(pg1);
                //List<gp> currentGp = (List<gp>) request.getAttribute("gpList");
                for (order u : currentOrder) {
            %>
            html+="                            <tr>\n" +
                "                                <td><%=u.getorder_OI()%>\n" +
                "                                </td>\n" +
                "                                <td><%=u.getorder_FI()%>\n" +
                "                                </td>\n" +
                "                                <td><%=u.getorder_OP()%>\n" +
                "                                </td>\n" +
                "                                <td><%=u.getorder_NP()%>\n" +
                "                                </td>\n" +
                "                                <td><%=u.getorder_CT()%>\n" +
                "                                </td>\n" +
                "                                <td><%=u.getorder_NM()%>\n" +
                "                                </td>\n" +
                "                            </tr>";
            <%
                }
            %>

        }else if(id=="usersManagement"){
            html+="";
        }
        console.log(html);
        jQuery("#toBePrinted").html(html);
    }

    function $(selector){
        return document.querySelector(selector);
    }
    //获取整个页面
    $("#pr").onclick =function(){
        window.print();
    }


    $("#pr").onclick =function(){
        var oldHtml = $("body").innerHTML;
        var printbox = $(".page-content-wrapper").innerHTML;
        console.log(printbox);
        $("body").innerHTML = printbox;
        window.print();
        $("body").innerHTML = oldHtml;

    }

</script>
