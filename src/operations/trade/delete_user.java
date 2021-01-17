package operations.trade;

import org.json.JSONObject;
import tools.daoimpl.usershowImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class delete_user extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        // TODO 删除用户
        /*
            前端返回的数据格式为  user_id，根据用户id来删除用户
            后端返回给前端的数据格式为JSONObject，key为"msg",value为"删除成功"
            要利用是usershow的delete函数，要注意用户id在MySQL中为int类型的
            话说谁给我解释一下，为啥有Iuser还有userDAO
        */
        System.out.println("123123");
        try {
            response.setContentType("text/json; charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            //int user_id = request.getIntHeader("user_id");
            String user_id = request.getParameter("user_id");
            //System.out.println(user_id);


            usershowImpl usershow = new usershowImpl();

            String result = usershow.delete(user_id);

            //System.out.println(user_id);

            JSONObject returnData = new JSONObject();
            returnData.put("msg",result);
            out.print(returnData);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
