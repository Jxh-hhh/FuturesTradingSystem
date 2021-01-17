package operations.trade;

import org.json.JSONObject;
import tools.dao.Iorder_history;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import tools.daoimpl.*;

public class delete_order_history extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO 写删除历史订单的servlet
        /*
            从前台收到的参数是 order_id 即订单号；
            利用上历史订单接口的delete函数
            其次返回JSONObject，key为"msg"，value为"删除成功"
        */
        try{
            response.setContentType("text/json; charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            String order_id = request.getParameter("order_id");
            order_historyImpl order_history = new order_historyImpl();
            String result = order_history.delete(order_id);
            JSONObject returnData = new JSONObject();
            returnData.put("msg",result);
            out.print(returnData);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
