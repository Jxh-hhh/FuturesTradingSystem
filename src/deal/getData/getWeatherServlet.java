package deal.getData;

import deal.util.JDBCUtil;
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

@WebServlet(name = "getWeatherServlet")
public class getWeatherServlet extends HttpServlet {
    String city = null;
    Connection con = null;
    Statement sm = null;
    String sql = null;
    ResultSet rs = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        city = request.getParameter("city_name");
        try{
            con = JDBCUtil.getConnection();
            sm = con.createStatement();
            sql = "select * from weather where city='" + city + "'";
            rs = sm.executeQuery(sql);
            if(city.equals("")){
                city = "成都";
                sql = "select * from weather where city='" + city + "'";
                rs = sm.executeQuery(sql);
            }
            while (rs.next()){
                JSONObject data = new JSONObject();
                data.put("city", rs.getString("city"));
                data.put("current_date", rs.getString("date"));
                data.put("high", rs.getString("high"));
                data.put("low", rs.getString("low"));
                data.put("fengxiang", rs.getString("fengxiang"));
                data.put("tomorrow_date", rs.getString("tomorrow_date"));
                data.put("tomorrow_high", rs.getString("tomorrow_high"));
                data.put("tomorrow_low", rs.getString("tomorrow_low"));
                data.put("tomorrow_fengxiang", rs.getString("tomorrow_fengxiang"));
                out.print(data);
            }
            rs.close();
            con.close();
            sm.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
