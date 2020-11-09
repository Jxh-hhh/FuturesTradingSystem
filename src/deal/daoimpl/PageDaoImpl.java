package deal.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import deal.dao.IpageDao;
import deal.util.JDBCUtil;

public class PageDaoImpl implements IpageDao {
	@Override
	public int getTotalPage(int pageSize) {  //总共多少页数
		
		int total=0,totalPage=30;
		//System.out.println("123321");
		//return totalPage;
		
		String sql="select gp_id from gp";
		//System.out.println(sql);
		Connection con = null;
		ResultSet rs = null;
		//System.out.println("totalPage:"+ totalPage);
		try {//连接数据库的操作
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
			JDBCUtil.getConnection();
			Statement stat = con.createStatement();
			rs = stat.executeQuery(sql);
			
			while(rs.next()){
				total++;
			}
			
			totalPage=total%pageSize>0?total/pageSize+1:total/pageSize;
			//System.out.println("total:"+ total);
			//System.out.println("totalPage:"+ totalPage);
			
			
		} catch (Exception e) {
			e.toString();
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

		return totalPage; 		 
	}
}