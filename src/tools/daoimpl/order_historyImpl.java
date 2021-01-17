package tools.daoimpl;

import tools.dao.Iorder_history;
import tools.entity.Page;
import tools.entity.order_history;
import tools.enums.UserDeleteEnum;
import tools.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class order_historyImpl implements Iorder_history {
    public Connection con=null;
    public PreparedStatement pst=null;
    public Statement sm=null;
    public ResultSet rs=null;
    @Override
    public List<order_history> queryOrderByPage(Page page) throws SQLException {
        List<order_history> arr = new ArrayList();

        try{
			/*Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			con = DriverManager.getConnection(url, "root", "z9682576");*/
            con = JDBCUtil.getConnection();
            Statement stat = con.createStatement();
            String sql = "select * from gp_ordermanagement_history limit ?,?";
            pst=con.prepareStatement(sql);
            pst.setInt(1, page.getIndex()*page.getPageSize());
            pst.setInt(2, page.getPageSize());
            rs=pst.executeQuery();
            while(rs.next()){
                order_history temp = new order_history(rs.getString("gp_OI"),rs.getString("gp_FI"),rs.getString("gp_ON"),rs.getString("gp_OP"),rs.getString("gp_NP"),rs.getString("gp_CT"),rs.getInt("gp_NM"),rs.getString("username"), rs.getDouble("yingkui"));
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
    public String delete(String order_id) {
        // TODO 这里写sql删除语句并更新数据库
        int jdNumber = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            preparedStatement = connection.prepareStatement("delete from gp_ordermanagement_history where gp_OI=?");
            preparedStatement.setObject(1, order_id);
            jdNumber = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeUpdate(preparedStatement, connection);
        }

        //判断删除结果
        if (jdNumber != 0){
            return UserDeleteEnum.USER_DELETE_SUCCESS.getValue();
        }
        else {
            return UserDeleteEnum.USER_IS_NON_EXIST.getValue();
        }
    }
}
