package deal.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import deal.biz.UserBiz;
import deal.bizimpl.UserBizImpl;
import deal.enums.UserRegisterEnum;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = null;
		String username = request.getParameter("register_username");
		String password = request.getParameter("register_password");
		String againpassword = request.getParameter("rpassword");
		try {
			UserBiz userBIZ = new UserBizImpl();
			result = userBIZ.userRegister(username, password, againpassword,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (result.equals(UserRegisterEnum.USER_REGISTER_SUCCESS.getValue())) {
				request.getRequestDispatcher("LoginAndRegister.jsp?msg=" + result + "").forward(
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
