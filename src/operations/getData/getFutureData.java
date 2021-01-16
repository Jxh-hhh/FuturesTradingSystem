package operations.getData;

import tools.util.JDBCUtil;

import java.sql.Connection;
import java.sql.Statement;

import static operations.getData.getGPData.getReturnData;
import static operations.getData.getGPData.readTxtFile;

public class getFutureData {
    public static void getFutureDataToDB(){
        // TODO 记得更改路径，这个txt在web-inf下
        String filePath = "D:\\IDEAprojects\\FuturesTradingSystem\\web\\WEB-INF\\future_code.txt";
        String[] fileContent = readTxtFile(filePath, 1);
        String[] code = null;
        code = fileContent[0].split(",");

        try {
            Connection con = JDBCUtil.getConnection();
            Statement sm = con.createStatement();
            for(int i = 0; i < code.length; i++){
                String url = "http://hq.sinajs.cn/list=";
                url = url + code[i];
                String data = getReturnData(url, "gb2312");
                String[] futureData = getGPData.getGPData(data);
                String sql = null;
                if(futureData.length > 5) {
                    sql = "replace into future(future_id, future_name, future_price_today, future_price_yesterday, future_price_current, future_price_MAX, future_price_MIN) values('"
                            + code[i] + "','" + futureData[0] + "','" + futureData[2] + "','" + futureData[5] + "','" + futureData[8] + "','" + futureData[3] + "','" + futureData[4] + "')";
                    sm.executeUpdate(sql);
                }
            }
            con.close();
            sm.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
