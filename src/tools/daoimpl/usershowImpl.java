package tools.daoimpl;

import java.sql.*;
import java.util.*;

import tools.dao.Iuser;
import tools.entity.Page;
import tools.entity.User;
import tools.util.JDBCUtil;
import tools.entity.usershow;
import tools.util.StringUtil;
import tools.enums.*;

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
    public String delete(String user_id) {
        // TODO 删除用户函数，sql实现
        int number = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = JDBCUtil.getConnection();
            preparedStatement = connection.prepareStatement("delete from users where userid=?");
            preparedStatement.setObject(1, user_id);
            number = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeUpdate(preparedStatement, connection);
        }

        System.out.println("这里是usershowImpl.delete,numberIs:"+number);

        if (number != 0) {
            return UserDeleteEnum.USER_DELETE_SUCCESS.getValue();
        }
        return UserDeleteEnum.USER_IS_NON_EXIST.getValue();
    }

    @Override
    public String update(String user_id, String userName, String userPassword, String userAuthority) {
        // TODO 更新用户函数，sql实现
//        System.out.println("这里是usershowImpl.update");
//        System.out.println(userName+" "+userPassword+" "+userAuthority+" "+user_id);
        if(StringUtil.isEmpty(userName)){
            return UserUpdateEnum.USER_NAME_IS_NULL.getValue();
        }

        if(StringUtil.isEmpty(userPassword)){
            return UserUpdateEnum.USER_PASSWORD_IS_NULL.getValue();
        }

        if(StringUtil.isEmpty(userName)){
            return UserUpdateEnum.USER_AUTHORITY_IS_NULL.getValue();
        }

        String Manager="manager";
        String User="user";
        if(!Manager.equals(userAuthority) && !User.equals(userAuthority)){
            return UserUpdateEnum.USER_AUTHORITY_IS_INCORRECT.getValue();
        }

        tools.entity.User user = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int executeCount = 0;

        try {
            connection = JDBCUtil.getConnection();


            preparedStatement = connection.prepareStatement("update users set username=?,password=?,authority=? where userid=?");
            preparedStatement.setObject(1, userName);
            preparedStatement.setObject(2, userPassword);
            preparedStatement.setObject(3, userAuthority);
            preparedStatement.setObject(4, user_id);

            executeCount = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.closeUpdate(preparedStatement, connection);
        }
        //System.out.println("executeCount:"+executeCount);




        if(executeCount != 0){
            return UserUpdateEnum.USER_UPDATE_IS_SUCCESS.getValue();
        }
        return UserUpdateEnum.USER_UPDATE_IS_FAILED.getValue();
    }
}