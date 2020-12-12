package deal.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import deal.biz.UserBiz;
import deal.bizimpl.UserBizImpl;
import deal.enums.UserLoginEnum;
import org.json.JSONObject;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	
	//@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String result = null;
		String username = request.getParameter("login_username");
		String password = request.getParameter("login_password");

		
		try {
			UserBiz userBiz = new UserBizImpl();
			result = userBiz.userLogin(username, password, request);
			JSONObject returnData = new JSONObject();
			returnData.put("msg",result);
			out.print(returnData);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

