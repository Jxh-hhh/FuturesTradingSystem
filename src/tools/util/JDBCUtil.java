package tools.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class JDBCUtil {
	private static final String driver="com.mysql.jdbc.Driver";
	//数据库名称填写自己的：这里是mytest，上文有提到
	//TODO 这里修改数据库地址，账号密码
	private static final String url="jdbc:mysql://localhost:3306/ftsdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
	private static final String user="root";
	private static final String password="12345678";
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static void closeQuery(java.sql.ResultSet resultSet,
			java.sql.PreparedStatement preparedStatement, java.sql.Connection connection) {
		try {
			resultSet.close();
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("打开数据库失败");
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		
		try {
			return (Connection) DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			System.out.println("打开数据库失败");
			e.printStackTrace();
		}
		return null;
		
	}

	
	// 增删查改的关闭
	public static void closeUpdate(
			java.sql.PreparedStatement preparedStatement,
			java.sql.Connection connection) {
		try {
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("打开数据库失败");
			e.printStackTrace();
		}
	}
}