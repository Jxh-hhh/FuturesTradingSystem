package deal.daoimpl;

import java.sql.*;
import java.util.*;

import deal.dao.Igp;
import deal.entity.Page;
import deal.entity.gp;
import deal.util.JDBCUtil;


public class GpDaoImpl implements Igp{
	public Connection con=null;
    public PreparedStatement pst=null;
    public Statement sm=null;
	public ResultSet rs=null;
	@Override
	public List<gp> queryGpByPage(Page page, String type) throws SQLException {
		List<gp> arr = new ArrayList();
		
		try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
			con = JDBCUtil.getConnection();
			Statement stat = con.createStatement();
			String tableName = null;
			if(type.equals("SHA")){
				tableName = "gp_SHA";
			}
			else if(type.equals("SZA")){
				tableName = "gp_SZA";
			}
			else{
				System.out.println("无");
			}
			String sql = "select * from " + tableName + " limit ?,?";
			pst=con.prepareStatement(sql);
			pst.setInt(1, page.getIndex()*page.getPageSize());
			pst.setInt(2, page.getPageSize());
			rs=pst.executeQuery();
			while(rs.next()){
				gp temp = new gp(rs.getString("gp_id"),rs.getString("gp_name"),rs.getString("gp_price_today"),rs.getString("gp_price_yesterday"),rs.getString("gp_price_current"),rs.getString("gp_price_MAX"),rs.getString("gp_price_MIN"));
				arr.add(temp);
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {//关闭连接
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
}
