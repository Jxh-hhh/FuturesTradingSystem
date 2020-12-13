package deal.daoimpl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import deal.dao.UserDAO;
import deal.entity.Page;
import deal.entity.User;
import deal.entity.User;
import deal.util.JDBCUtil;

import javax.servlet.http.HttpServletRequest;

public class UserDAOImpl implements UserDAO {

	
	//用户登录，查询用户是否存在
	public User userLogin(String username, String password) {
		User user = null;
		java.sql.Connection connection = null;
		java.sql.PreparedStatement preparedStatement = null;
		java.sql.ResultSet resultSet = null;
		try {
			connection = JDBCUtil.getConnection();
			preparedStatement = connection.prepareStatement("select userid,username,password,authority from users where username=? and password=?");
			preparedStatement.setObject(1, username);
			preparedStatement.setObject(2, password);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new User();
				user.setUserid(resultSet.getString("USERID"));
				user.setUsername(resultSet.getString("USERNAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setAuthority(resultSet.getString("AUTHORITY"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeQuery(resultSet, preparedStatement, connection);
		}
		return user;
	}
	
	
	//用户注册过程，判断用户名存在否
	public User userToRegister(String username) {
		User user = null;
		java.sql.Connection connection = null;
		java.sql.PreparedStatement preparedStatement = null;
		java.sql.ResultSet resultSet = null;
		
		try {
			connection = JDBCUtil.getConnection();
			preparedStatement = connection.prepareStatement("select username from users where username=?");
			preparedStatement.setObject(1, username);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				user = new User();
				user.setUsername(resultSet.getString("USERNAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeQuery(resultSet, preparedStatement, connection);
		}
		return user;
	}

	
	//用户注册过程，创建新用户
	public int userRegister(String username, String password,String mailbox,String fullname) {
		User user = null;
		java.sql.Connection connection = null;
		java.sql.PreparedStatement preparedStatement = null;
		int executeCount = 0;
		
		try {
			connection = JDBCUtil.getConnection();
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = formatter.format(new Date(System.currentTimeMillis()));

			preparedStatement = connection.prepareStatement("insert into users (username,password,mailbox,authority,createTime,fullname) values(?,?,?,?,?,?)");
			preparedStatement.setObject(1, username);
			preparedStatement.setObject(2, password);
			preparedStatement.setObject(3,mailbox);
			preparedStatement.setObject(4, "user");
			preparedStatement.setObject(5, date);
			preparedStatement.setObject(6,fullname);
			executeCount = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeUpdate(preparedStatement, connection);
		}
		return executeCount;
	}

	//用户重置密码的过程
	@Override
	public int resetUserPassword(String accountNumber,String newPassword, HttpServletRequest request){
		java.sql.Connection connection = null;
		java.sql.PreparedStatement preparedStatement = null;
		java.sql.ResultSet resultSet = null;
		String mailBox=request.getSession().getAttribute("usersEmail").toString();
		System.out.println(mailBox);
		int executeCount = 0;

		try {
			connection = JDBCUtil.getConnection();

			preparedStatement = connection.prepareStatement("update users set password=? where username=? and mailbox=?");
			preparedStatement.setObject(1, newPassword);
			preparedStatement.setObject(2, accountNumber);
			preparedStatement.setObject(3,mailBox);

			executeCount =preparedStatement.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeUpdate(preparedStatement, connection);
		}
		return executeCount;
	}

	public Connection con=null;
	public PreparedStatement pst=null;
	public Statement sm=null;
	public ResultSet rs=null;
	@Override
	public List<User> queryUserByPage(Page page) throws SQLException {

		List<User> arr = new ArrayList();

		try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
			con = JDBCUtil.getConnection();
			Statement stat = con.createStatement();
			String sql = "select * from users limit ?,?";
			pst=con.prepareStatement(sql);
			pst.setInt(1, page.getIndex()*page.getPageSize());
			pst.setInt(2, page.getPageSize());
			rs=pst.executeQuery();
			while(rs.next()){
				//User temp = new User(Integer.parseInt(rs.getString("userid")),rs.getString("username"),rs.getString("password"),rs.getString("authority"),rs.getString("createTime"));
				//arr.add(temp);
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