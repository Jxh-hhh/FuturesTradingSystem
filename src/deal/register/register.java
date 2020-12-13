package deal.register;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import deal.biz.UserBiz;
import deal.bizimpl.UserBizImpl;
import deal.sendMail.*;
import deal.enums.UserRegisterEnum;
import org.json.JSONObject;

/**
 * Servlet implementation class register
 */
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
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("register_username");
		String password = request.getParameter("register_password");
		String againpassword = request.getParameter("rpassword");
		String mailbox = request.getParameter("register_mailbox");
		String fullname = request.getParameter("register_fullname");
		String verifycode = request.getParameter("register_verifycode");

		System.out.println(verifycode);



		try {
			UserBiz userBIZ = new UserBizImpl();
			String result = userBIZ.userRegister(username, password, againpassword,mailbox,fullname,verifycode,request);
			JSONObject data = new JSONObject();
			data.put("msg",result);
			out.print(data);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
