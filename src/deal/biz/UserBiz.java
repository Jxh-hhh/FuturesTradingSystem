package deal.biz;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public interface UserBiz {

	//用户登录
	String userLogin(String username, String password, HttpServletRequest request);

	//用户注册
	String userRegister(String username, String password, String againpassword,HttpServletRequest request);

	//用户修改密码
	String userResetPassword(String passwordOne, String passwordTwo, HttpServletRequest request);

}