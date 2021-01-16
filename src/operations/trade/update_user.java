package operations.trade;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class update_user extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        // TODO 删除用户
        /*
            1. 前端返回的数据为username，password，authority均为String类型
            2. 修改用户信息的逻辑：获取前端用户输入的值，更新数据库
            3. 后端返回数据为JSONObject，key为"msg"
            4. 而后端的value有以下几种：①用户名相同返回：修改失败，原因：用户名重复
                                    ②authority只能为manager或user：修改失败，原因：权限只能为manager或user
                                    ③以上两条都符合时，返回：修改成功
            5. 要用上usershow里边写的update函数
         */
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        doPost(request,response);
    }
}
