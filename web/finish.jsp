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
    out.println("页面传递过来的数据获取完毕");
    System.out.println("页面传递过来的数据获取完毕");

    //开始连接数据库，需要先把mysql-connector-java-5.0.4-bin.jar和json.jar拷贝到ROOT/WEB-INF/lib下
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException classnotfoundexception) {
        classnotfoundexception.printStackTrace();
    }
    out.println("加载了JDBC驱动");
    System.out.println("加载了JDBC驱动");


    //然后链接数据库，开始操作数据表
    try {
        Connection conn = DriverManager
                .getConnection("jdbc:mysql://localhost:3306/trade_control?user=root&password=123&useUnicode=true&characterEncoding=UTF-8");
        System.out.println("准备statement。");
        Statement statement = conn.createStatement();
        System.out.println("已经链接上数据库！");
        out.println("Connect Database Ok！！！<br>");
        String sql = "insert into gp_OrderManagement(gp_OI,gp_FI,gp_CT,gp_ON,gp_OP,gp_NM) values('"
                + OI + "','" + FI + "','" + CT +"','" + ON +"','" + OP +"','" + NM +"')";
        out.println("即将执行的SQL语句是："+sql);
        System.out.println("即将执行的SQL语句是："+sql);
        statement.executeUpdate(sql);
        statement.close();
        conn.close();
        out.println("Database Closed！！！<br>");
        System.out.println("操作数据完毕，关闭了数据库！");
%>
添加成功！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='device_list.jsp'">
<%
} catch (SQLException sqlexception) {
    sqlexception.printStackTrace();
%>
添加失败！！！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='device_list.jsp'">
<%
    }
    out.println("页面执行完毕！");
    System.out.println("页面执行完毕！");
%>
<button onclick="window.location.href='index.jsp'">返回</button>
</body>
</html>
