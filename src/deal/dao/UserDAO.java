package deal.dao;

import deal.entity.User;

public interface UserDAO {
	// 阿里规范 公开 的 抽象的 这两个 描述 不需要手动的写出来
		//用户登录
		User userLogin(String username, String password);
		
		//用户注册
		int userRegister(String username, String password);
		
		//判断注册用户名存在否
		User userToRegister(String username);
}