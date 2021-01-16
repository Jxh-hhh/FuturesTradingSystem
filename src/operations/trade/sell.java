package operations.trade;

import tools.util.JDBCUtil;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "sell")
public class sell extends HttpServlet {
    public Connection con = null;
    public Statement sm = null;
    public ResultSet rs = null;
    public String sql = null;
    public String m_id = null;
    public String gp_CT = null;
    public String gp_ON = null;
    public String gp_FI = null;
    public String gp_OP = null;
    public String gp_NP = null;
    public int gp_NM = 0;
    public String username = null;
    public int m_money =0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        m_id = request.getParameter("m_id");
        Connection con = JDBCUtil.getConnection();
        try {
            sm = con.createStatement();
            sql = "select * from gp_ordermanagement where gp_OI='"+ m_id +"'";
            rs = sm.executeQuery(sql);
            while (rs.next()){
                gp_CT = rs.getString("gp_CT");
                gp_ON = rs.getString("gp_ON");
                gp_FI = rs.getString("gp_FI");
                gp_OP = rs.getString("gp_OP");
                gp_NP = rs.getString("gp_NP");
                username = rs.getString("username");
                gp_NM = rs.getInt("gp_NM");
            }
            Double gp_op = Double.parseDouble(gp_OP);
            Double gp_np = Double.parseDouble(gp_NP);
            int money = (int)(gp_np * gp_NM);
            int yingkui = (int)((gp_np-gp_op) * gp_NM);
            sql = "select money from users where username='"+ username +"'";
            rs = sm.executeQuery(sql);
            while(rs.next()){
                m_money = rs.getInt("money");
            }
            m_money = money + m_money;
            sql = "UPDATE users SET money = "+ m_money + " WHERE username = '"+ username + "'";
            sm.executeUpdate(sql);
            if(yingkui > 0){
                JSONObject data = new JSONObject();
                data.put("msg","赚了" + yingkui);
                out.print(data);
            }
            else if(yingkui == 0){
                JSONObject data = new JSONObject();
                data.put("msg","不亏不赚");
                out.print(data);
            }
            else{
                JSONObject data = new JSONObject();
                data.put("msg","亏了" + -1 * yingkui);
                out.print(data);
            }
            sql = "insert into gp_ordermanagement_history(gp_OI,gp_FI,gp_CT,gp_ON,gp_OP,gp_NM,username,yingkui) values('"
                    + m_id + "','" + gp_FI + "','" + gp_CT +"','" + gp_ON +"','" + gp_OP +"','" + gp_NM +"','" + username +"'" +
                    ",'" + yingkui + "')";
            sm.executeUpdate(sql);
            sql = "delete from gp_ordermanagement where gp_OI='"+ m_id +"'";
            sm.executeUpdate(sql);
            rs.close();
            sm.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
