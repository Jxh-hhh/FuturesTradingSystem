package deal.getData;

import deal.util.JDBCUtil;

import java.io.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.Statement;

public class getGPData {
    public static String[] readTxtFile(String filePath, int n){
        String[] all = new String[n];
        try {
            String encoding="UTF-8";
            File file=new File(filePath);
            if(file.isFile() && file.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                int i = 0;
                while((lineTxt = bufferedReader.readLine()) != null){
                    all[i] = lineTxt;
                    i++;
                }
                read.close();
            }else{
                System.out.println("找不到指定的文件");
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return all;
    }

    public static String getReturnData(String urlString, String encoding){
        String res = "";
        try {
            URL url = new URL(urlString);
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection)url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream(),encoding));
            String line;
            while ((line = in.readLine()) != null) {
                res += line;
            }
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public static String[] getGPData(String data){
        String regex1 = "var.*=\"";
        String regex2 = ";";
        data = data.replaceAll(regex1, "");
        data = data.replaceAll(regex2, "");
        return data.split(",");
    }

    public static void getDataToDB(String type){
        String filePath = "C:\\Program Files (x86)\\MySQL\\MySQL Server 5.1\\gp_code.txt";
        String[] fileContent = readTxtFile(filePath, 2);
        String[] code = null;
        String tableName = null;
        if(type.equals("SZA")){
            code = fileContent[0].split(",");
            tableName = "gp_SZA";
        }
        else if(type.equals("SHA")){
            code = fileContent[1].split(",");
            tableName = "gp_SHA";
        }
        else{
            System.out.println("股票不存在");
        }

        try {
            Connection con = JDBCUtil.getConnection();
            Statement sm = con.createStatement();
            for(int i = 0; i < code.length; i++){
                String url = "http://hq.sinajs.cn/list=";
                url = url + code[i];
                String data = getReturnData(url, "gb2312");
                String[] gpData = getGPData(data);
                String sql = "replace into " + tableName + "(gp_id, gp_name, gp_price_today, gp_price_yesterday, gp_price_current, gp_price_MAX, gp_price_MIN) values('"
                        + code[i] + "','" + gpData[0] + "','" + gpData[1] + "','" + gpData[2] + "','" + gpData[3] + "','" + gpData[4]+ "','" + gpData[5] + "')";
                sm.executeUpdate(sql);
            }
            con.close();
            sm.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}