package finishServlet;

import deal.util.JDBCUtil;
import sun.plugin.dom.core.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "deposit")
public class deposit extends HttpServlet {
    public Connection con = null;
    public Statement sm = null;
    public ResultSet rs = null;
    public String name = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/json; charset=utf-8");
        String money2 = request.getParameter("input_money");
        request.setCharacterEncoding("UTF-8");

        Connection con = JDBCUtil.getConnection();
        try {
            sm = con.createStatement();
            name = (String)session.getAttribute("name");
            String sql = "select * from users where username = " + " '" + name + "'";
            ResultSet rs = sm.executeQuery(sql);
            int money1 = 99999;
            while(rs.next())
            {
                money1 = rs.getInt("money");
            }
            int a = Integer.valueOf(money1).intValue();
            int b = Integer.valueOf(money2).intValue();
            int c = a + b;
            sql = "UPDATE users SET money = "+ c + " WHERE username = '"+ name + "'";
            sm.executeUpdate(sql);
            sm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
