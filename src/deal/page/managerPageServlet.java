package deal.page;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;

import deal.dao.UserDAO;
import deal.entity.User;
import deal.util.JDBCUtil;
import deal.daoimpl.GpDaoImpl;
import deal.daoimpl.PageDaoImpl;
import deal.entity.Page;
import deal.entity.User;
import deal.entity.gp;
import deal.util.JDBCUtil;
import netscape.javascript.JSObject;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet(name = "managerPageServlet")
public class managerPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("123");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        System.out.println(username);
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        String authority=null;
        try {
            connection = JDBCUtil.getConnection();
            preparedStatement = connection.prepareStatement("select authority from users where username=?");
            preparedStatement.setString(1,username);
            rs = preparedStatement.executeQuery();
            authority=rs.getString("authority");
            while (rs.next()) {
                authority=rs.getString("authority");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeQuery(rs, preparedStatement, connection);
        }

        response.setContentType("json/application;charset=UTF-8");
        try{
            response.getWriter().write(authority);
            response.getWriter().flush();
            response.getWriter().close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        System.out.println("321");
        try{
            response.getWriter().write("manager");
            response.getWriter().flush();
            response.getWriter().close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
