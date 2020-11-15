<%@page language="java"
        import="java.util.*,java.sql.*,deal.entity.*,deal.dao.*,deal.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="order" scope="page" class="deal.daoimpl.orderImpl"/>
<jsp:useBean id="pg" scope="page" class="deal.daoimpl.PageDaoImpl"/>
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
                + "orderlist.xls");

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
        List<order> currentOrder = (List<order>) order.queryOrderByPage(pg1);
        //List<gp> currentGp = (List<gp>) request.getAttribute("gpList");
        for (order u : currentOrder) {
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
    </tr>
    <%
        }
    %>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br>

<%
    if (exportToExcel == null) {
%>
<a href="exportExcel.jsp?exportToExcel=YES">Export to Excel</a>
<%
    }
%>
</body>
</html>

