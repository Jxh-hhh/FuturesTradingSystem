<%@page language="java"
        import="java.util.*,java.sql.*,deal.entity.*,deal.dao.*,deal.daoimpl.*"
        contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="usershow" scope="page" class="deal.daoimpl.usershowImpl"/>
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
                + "userslist.xls");

    }
%>
<table align="left" border="2">
    <thead>
    <tr bgcolor="lightgreen">
        <th>用户id</th>
        <th>用户名</th>
        <th>密码</th>
        <th>角色</th>
        <th>创建时间</th>
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
        <td><%=u.getshow_userid()%>
        </td>
        <td><%=u.getshow_username()%>
        </td>
        <td><%=u.getshow_password()%>
        </td>
        <td><%=u.getshow_authority()%>
        </td>
        <td><%=u.getshow_createTime()%>
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
<a href="exportExcel1.jsp?exportToExcel=YES">Export to Excel</a>
<%
    }
%>
</body>
</html>

