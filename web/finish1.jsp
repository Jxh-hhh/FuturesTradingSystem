<%--
  Created by IntelliJ IDEA.
  User: jxh
  Date: 2020/11/1
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.io.*"%>
<%@ page import="deal.util.JDBCUtil" %>
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
    <title>充值成功</title>
</head>
<body >
<%
    //获取add_file.jsp页面提交后传递过来的参数，在form里的参数才能传递过来，注意name和id的区别
    String money2 = request.getParameter("input_money");
    request.setCharacterEncoding("UTF-8");

    Connection con = JDBCUtil.getConnection();
    Statement stat = con.createStatement();
    String sql = "select * from users where username = " + " '" + name + "'";
    ResultSet rs = stat.executeQuery(sql);
    int money1 = 99999;
    while(rs.next())
    {
        money1 = rs.getInt("money");
    }
    int a = Integer.valueOf(money1).intValue();
    int b = Integer.valueOf(money2).intValue();
    int c = a + b;
    out.println("提交成功！！！<br>");
    sql = "UPDATE users SET money = "+ c + " WHERE username = '"+ name + "'";
    stat.executeUpdate(sql);
    stat.close();
    con.close();
%>

<button onclick="window.location.href='index.jsp'">返回</button>
</body>
</html>
