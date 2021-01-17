<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2021-01-13
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java"
        import="java.util.*,java.sql.*,tools.entity.*,tools.dao.*,tools.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pg" scope="page" class="tools.daoimpl.PageDaoImpl"/>
<jsp:useBean id="order_history" scope="page" class="tools.daoimpl.order_historyImpl"/>
<%
    //判断是否未登录，用的session判断，可用filter，之后再说
    String name=(String)session.getAttribute("loginUsername");
    String authority=(String)session.getAttribute("Authority");
    if(name==null){
        response.sendRedirect("LoginAndRegister.jsp");
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>导入到Excel</title>
</head>
<body>
<%
    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel != null
            && exportToExcel.toString().equalsIgnoreCase("YES")) {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "inline; filename="
                + "userslist.xls");

    }
%>
<table align="left" border="2">
    <thead>
    <tr bgcolor="lightgreen">
        <th>订单号</th>
        <th>期货编号</th>
        <th>开仓价</th>
        <th>最新价</th>
        <th>创建时间</th>
        <th>数量</th>
        <th>盈亏</th>
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
        List<order_history> currentOrder = (List<order_history>) order_history.queryOrderByPage(pg1);
        //List<gp> currentGp = (List<gp>) request.getAttribute("gpList");
        for (order_history u : currentOrder)if(u.getUsername().equals(name)){
    %>
    <tr>
        <td><%=u.getorder_OI()%>
        </td>
        <td><%=u.getorder_FI()%>
        </td>
        <td><%=u.getorder_OP()%>
        </td>
        <td><%=u.getorder_NP()%>
        </td>
        <td><%=u.getorder_CT()%>
        </td>
        <td><%=u.getorder_NM()%>
        </td>
        <td>
            <%=u.getYingkui()%>
        </td>
    </tr>
    <%
        }
    %>


<%
    if (exportToExcel == null) {
%>
<a href="exportExcelUOH.jsp?exportToExcel=YES">Export to Excel</a>
<%
    }
%>
</body>
</html>
