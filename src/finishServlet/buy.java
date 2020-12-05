package finishServlet;

import deal.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "buy")
public class buy extends HttpServlet {
    public Connection con = null;
    public Statement sm = null;
    public ResultSet rs = null;
    public String name = null;
    public String gp_orderid = null;
    public String gp_id = null;
    public String gp_price = null;
    public String current_time = null;
    public String gp_number = null;
    public String message = null;
    public int money = 0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/json; charset=utf-8");
        HttpSession session = request.getSession();
        name = (String)session.getAttribute("loginUsername");
        System.out.println(name);
        gp_orderid = request.getParameter("gp_orderid");
        gp_id = request.getParameter("gp_id");
        gp_price= request.getParameter("gp_price");
        current_time = request.getParameter("current_time");
        gp_number= request.getParameter("gp_number");
        request.setCharacterEncoding("UTF-8");
        Connection con = JDBCUtil.getConnection();
        try {
            sm = con.createStatement();
            String sql = "select money from users where username = '" +name+ "'";
            rs = sm.executeQuery(sql);
            while(rs.next()){
                money = rs.getInt("money");
            }
            Double price = Double.parseDouble(gp_price);
            int number = Integer.valueOf(gp_number).intValue();
            if( money < price * number){
                message = "0";
                out.println(message);
            }
            else{
                message = "1";
                out.println(message);
                sql = "insert into gp_ordermanagement(gp_OI,gp_FI,gp_CT,gp_ON,gp_OP,gp_NM,username) values('"
                        + gp_orderid + "','" + gp_id + "','" + current_time +"','" + gp_number +"','" + gp_price +"','" + gp_number +"','" + name +"')";
                System.out.println(sql);
                sm.executeUpdate(sql);
                money = (int) (money - price * number);
                sql =  "UPDATE users SET money = "+ money + " WHERE username = '"+ name + "'";
                sm.executeUpdate(sql);
            }
            rs.close();
            sm.close();
            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
