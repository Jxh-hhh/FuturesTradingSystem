<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2020/11/1
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.io.*"%>
<html>
<head>
    <title>提交成功</title>
</head>
<body>
<%
    //获取add_file.jsp页面提交后传递过来的参数，在form里的参数才能传递过来，注意name和id的区别
    String OI = request.getParameter("gp_orderid");
    String FI = request.getParameter("gp_id");
    String ON = request.getParameter("gp_name");
    String OP = request.getParameter("gp_price");
    String CT = request.getParameter("current_time");
    String NM = request.getParameter("gp_number");
    request.setCharacterEncoding("UTF-8");


    //开始连接数据库，需要先把mysql-connector-java-5.0.4-bin.jar和json.jar拷贝到ROOT/WEB-INF/lib下
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException classnotfoundexception) {
        classnotfoundexception.printStackTrace();
    }



    //然后链接数据库，开始操作数据表
    try {
        Connection conn = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/trade_control?user=root&password=123&useUnicode=true&characterEncoding=UTF-8");

        Statement statement = conn.createStatement();

        out.println("提交成功！！！<br>");
        String sql = "insert into gp_OrderManagement(gp_OI,gp_FI,gp_CT,gp_ON,gp_OP,gp_NM) values('"
                + OI + "','" + FI + "','" + CT +"','" + ON +"','" + OP +"','" + NM +"')";

        statement.executeUpdate(sql);
        statement.close();
        conn.close();

%>


<%
} catch (SQLException sqlexception) {
    sqlexception.printStackTrace();
%>

<%
    }

%>
<button onclick="window.location.href='index.jsp'">返回</button>
</body>
</html>
