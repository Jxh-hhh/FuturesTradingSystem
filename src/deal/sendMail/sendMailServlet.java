package deal.sendMail;

import deal.entity.User;
import netscape.javascript.JSObject;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class sendMailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            response.setContentType("text/json; charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            request.getSession().setAttribute("usersEmail", email);//把用户邮件塞到session里面

            System.out.println("把用户信息注册到数据库中");
            //用户注册成功之后就使用用户注册时的邮箱给用户发送一封Email
            //发送邮件是一件非常耗时的事情，因此这里开辟了另一个线程来专门发送邮件
            sendMail send = new sendMail(email);

            //提前保存验证码防止进入线程后提取不出来
            String verifyCode = send.getVerifyCode();
            request.getSession().setAttribute("verifyCode",verifyCode);

            //启动线程，线程启动之后就会执行run方法来发送邮件
            send.start();

            //注册用户
            //new UserService().registerUser(user);
            //System.out.println("验证码："+verifyCode);
//            request.getSession().setAttribute("verifyCode", verifyCode);
//            request.setAttribute("message", "恭喜您，邮件发送成功，请稍等！");
//            request.getRequestDispatcher("/message.jsp").forward(request, response);
            JSONObject returnData = new JSONObject();
            returnData.put("msg","邮件发送成功！");
            out.print(returnData);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}