package deal.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import deal.biz.UserBiz;
import deal.bizimpl.UserBizImpl;
import deal.enums.UserLoginEnum;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	
	//@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		String result = null;
		String username = request.getParameter("login_username");
		String password = request.getParameter("login_password");

		
		try {
			UserBiz userBiz = new UserBizImpl();
			result = userBiz.userLogin(username, password, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (result.equals(UserLoginEnum.USER_LOGIN_SUCCESS.getValue())) {
				request.getRequestDispatcher("index.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("LoginAndRegister.jsp?msg=" + result + "")
						.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

