package deal.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class JDBCUtil {

	//useSSL=false 是Mysql数据库的SSL连接问题，提示警告不建议使用没有带服务器身份验证的SSL连接
	/*private static final String driver="com.mysql.jdbc.Driver";
	//数据库名称填写自己的：这里是mytest，上文有提到
	private static final String url="jdbc:mysql://localhost:3306/test?user=root&password=z9682576&useUnicode=true&characterEncoding=UTF-8";
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	public static Connection getConnection(){

		try {
			return (Connection) DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}*/
	private static final String driver="com.mysql.jdbc.Driver";
	//数据库名称填写自己的：这里是mytest，上文有提到
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