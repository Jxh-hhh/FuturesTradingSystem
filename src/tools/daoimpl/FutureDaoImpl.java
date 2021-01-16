package tools.daoimpl;

import tools.dao.Ifuture;
import tools.entity.Page;
import tools.entity.future;
import tools.entity.gp;
import tools.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FutureDaoImpl implements Ifuture {
    @Override
    public List<future> queryFutureByPage(Page page) throws SQLException {
        List<future> arr = new ArrayList();

        Connection con = null;
        ResultSet rs = null;
        Statement stat = null;
        PreparedStatement pst = null;
        try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
            con = JDBCUtil.getConnection();
            stat = con.createStatement();
            String sql = "select * from future limit ?,?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, page.getIndex()*page.getPageSize());
            pst.setInt(2, page.getPageSize());
            rs=pst.executeQuery();
            while(rs.next()){
                future temp = new future(rs.getString("future_id"),rs.getString("future_name"),rs.getString("future_price_today"),rs.getString("future_price_yesterday"),rs.getString("future_price_current"),rs.getString("future_price_MAX"),rs.getString("future_price_MIN"));
                arr.add(temp);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        try {//关闭连接
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
            stat.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }
}
