package tools.daoimpl;

import java.sql.*;
import java.util.*;

import tools.dao.Iuser;
import tools.entity.Page;
import tools.util.JDBCUtil;
import tools.entity.usershow;

public class usershowImpl implements Iuser {
    public Connection con=null;
    public PreparedStatement pst=null;
    public Statement sm=null;
    public ResultSet rs=null;
    @Override
    public List<usershow> queryUsershowByPage(Page page) throws SQLException {
        List<usershow> arr = new ArrayList();

        try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
            con = JDBCUtil.getConnection();
            Statement stat = con.createStatement();
            String sql = "select * from users limit ?,?";
            pst=con.prepareStatement(sql);
            pst.setInt(1, page.getIndex()*page.getPageSize());
            pst.setInt(2, page.getPageSize());
            rs=pst.executeQuery();
            while(rs.next()){
                usershow temp = new usershow(rs.getString("userid"),rs.getString("username"),rs.getString("password"),rs.getString("authority"),rs.getString("createTime"),rs.getInt("money"));
                arr.add(temp);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        try {//关闭连接
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public void delete(int user_id) {
        // TODO 删除用户函数，sql实现
    }

    @Override
    public void update(int user_id, String username, String password, String authority) {
        // TODO 更新用户函数，sql实现
    }
}