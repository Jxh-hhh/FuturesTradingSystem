package deal.daoimpl;

import java.sql.Date;
import java.text.SimpleDateFormat;

import deal.dao.UserDAO;
import deal.entity.User;
import deal.util.JDBCUtil;

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
				user.setUserid(resultSet.getInt("USERID"));
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
	public int userRegister(String username, String password) {
		User user = null;
		java.sql.Connection connection = null;
		java.sql.PreparedStatement preparedStatement = null;
		int executeCount = 0;
		
		try {
			connection = JDBCUtil.getConnection();
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
			Date date = new Date(System.currentTimeMillis());

			preparedStatement = connection.prepareStatement("insert into users (username,password,authority,createTime) values(?,?,?,?)");
			preparedStatement.setObject(1, username);
			preparedStatement.setObject(2, password);
			preparedStatement.setObject(3, "user");
			preparedStatement.setObject(4, date);
			executeCount = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeUpdate(preparedStatement, connection);
		}
		return executeCount;
	}

}