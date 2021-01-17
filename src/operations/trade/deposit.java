package operations.trade;

import tools.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet(name = "deposit")
public class deposit extends HttpServlet {
    public Connection con = null;
    public Statement sm = null;
    public String name = null;
    public String remain_money = null;
    public String input_money = null;
    public int sum_money = 0;
    public String message = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        name = request.getParameter("Username");
        remain_money = request.getParameter("remain_money");
        input_money = request.getParameter("input_money");
        String type = request.getParameter("type");
        request.setCharacterEncoding("UTF-8");
        Connection con = JDBCUtil.getConnection();
        try {
            sm = con.createStatement();
            int a = Integer.valueOf(remain_money).intValue();
            int b = Integer.valueOf(input_money).intValue();
            if(b < 0){
                message = "0";
                out.println(message);
            }
            else if(b == 0){
                message = "1";
                out.println(message);
            }
            else{
                if(type.equals("1")){
                    message = "2";
                    out.println(message);
                    sum_money = a + b;
                    String sql = "UPDATE users SET money = "+ sum_money + " WHERE username = '"+ name + "'";
                    sm.executeUpdate(sql);
                }
                else{
                    if(a < b){
                        message = "3";
                        out.println(message);
                    }
                    else{
                        message = "4";
                        out.println(message);
                        sum_money = a - b;
                        String sql = "UPDATE users SET money = "+ sum_money + " WHERE username = '"+ name + "'";
                        sm.executeUpdate(sql);
                    }
                }
            }
            sm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
