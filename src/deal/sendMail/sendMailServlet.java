package deal.sendMail;

import deal.entity.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class sendMailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String email = request.getParameter("email");

            System.out.println("把用户信息注册到数据库中");
            //用户注册成功之后就使用用户注册时的邮箱给用户发送一封Email
            //发送邮件是一件非常耗时的事情，因此这里开辟了另一个线程来专门发送邮件
            sendMail send = new sendMail(email);
            //启动线程，线程启动之后就会执行run方法来发送邮件
            send.start();

            //注册用户
            //new UserService().registerUser(user);
            request.setAttribute("message", "恭喜您，邮件发送成功，请稍等！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "邮件发送失败！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}