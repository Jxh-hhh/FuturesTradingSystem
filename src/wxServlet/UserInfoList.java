package wxServlet;

import deal.util.JDBCUtil;
import org.json.JSONArray;
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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "UserInfoList")
public class UserInfoList extends HttpServlet {
    public Connection con = null;
    public Statement sm = null;
    public ResultSet rs = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        try {
            con = JDBCUtil.getConnection();
            sm = con.createStatement();

            String sql = "select * from users";
            rs = sm.executeQuery(sql);

            JSONArray jsonArray = new JSONArray();

            while(rs.next()){
                JSONObject jsonObj = new JSONObject();
                jsonObj.put("userid", rs.getString("userid"));
                jsonObj.put("username", rs.getString("username"));
                jsonObj.put("authority", rs.getString("authority"));
                jsonObj.put("createTime", rs.getString("createTime"));

                jsonArray.put(jsonObj);
            }
            out = response.getWriter();

            out.println(jsonArray);
            rs.close();
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
