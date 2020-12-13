package deal.dao;

import deal.entity.Page;
import deal.entity.User;
import deal.entity.order;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

public interface UserDAO {
	// 阿里规范 公开 的 抽象的 这两个 描述 不需要手动的写出来
		//用户登录
		User userLogin(String username, String password);
		
		//用户注册
		int userRegister(String username, String password,String mailbox,String fullname);
		
		//判断注册用户名存在否
		User userToRegister(String username);

		//进行密码更改
		int resetUserPassword(String accountNumber,String newPassword, HttpServletRequest request);

		public List<User> queryUserByPage(Page page) throws SQLException;
}