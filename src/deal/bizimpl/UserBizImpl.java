package deal.bizimpl;

import javax.servlet.http.HttpServletRequest;

import deal.biz.UserBiz;
import deal.dao.UserDAO;
import deal.daoimpl.UserDAOImpl;
import deal.entity.User;
import deal.enums.UserLoginEnum;
import deal.enums.UserRegisterEnum;
import deal.util.StringUtil;

public class UserBizImpl implements UserBiz {
	
	UserDAO userDAO = new UserDAOImpl();
	
	//用户登录
	public String userLogin(String username, String password, HttpServletRequest request) {
		if (StringUtil.isEmpty(username)) {
			return UserLoginEnum.USER_NAME_IS_NUll.getValue();
		}
		if (StringUtil.isEmpty(password)) {
			return UserLoginEnum.USER_PASSWORD_IS_NULL.getValue();
		}
		User user = null;
		user = userDAO.userLogin(username,password);
		if (user == null) {
			return UserLoginEnum.USER_NAME_OR_PASSWORD_IS_FAIL.getValue();
		}
		// 登录成功后 把当前登录成功后的用户 存入到SESSION中 基本是 所有后台的必备功能
		request.getSession().setAttribute("user", user);
		
	
		return UserLoginEnum.USER_LOGIN_SUCCESS.getValue();
	}
	
	
	//用户注册
	public String userRegister(String username, String password, String againpassword,HttpServletRequest req) {
		
		if (StringUtil.isEmpty(username)) {
			return UserRegisterEnum.USER_REGISTER_NAME_IS_NULL.getValue();
		}
		if (StringUtil.isEmpty(password)) {
			return UserRegisterEnum.USER_REGISTER_PASSWORD_IS_NULL.getValue();
		}
		if(!password.equals(againpassword)){
			return UserRegisterEnum.USER_REGISTER_AGAINPASSWORD_IS_DIFFERENT.getValue();
		}
		
		User user = null;
		user = userDAO.userToRegister(username);
		if (user != null) {
			return UserRegisterEnum.USER_REGISTER_NAME_IS_EXIST.getValue();
		}
		
		Integer executeCount =  null;
		executeCount = userDAO.userRegister(username, password);
		if(executeCount != null){
			return UserRegisterEnum.USER_REGISTER_SUCCESS.getValue();
		}
		return null;
	}


}