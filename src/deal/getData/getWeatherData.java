package deal.getData;

import deal.util.JDBCUtil;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.Statement;
import java.util.zip.GZIPInputStream;

public class getWeatherData {
    public static String getWeather(String urlString) throws UnsupportedEncodingException {

        URL realUrl = null;
        ByteArrayOutputStream out = null;

        try {
            //真实地址
            realUrl = new URL(urlString);

            //打开连接
            HttpURLConnection connection = (HttpURLConnection) realUrl.openConnection();

            //设置连接属性
            connection.setRequestProperty("accept", "application/xhtml+xml,application/json,application/xml;charset=utf-8, text/javascript, */*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("contentType", "utf-8");
            connection.setRequestMethod("GET");
            connection.setRequestProperty("user-agent",
                    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko");

            //FileOutputStream out = new FileOutputStream("e:/text.txt");
            //这里获取的数据时压缩格式的数据所以用gzip进行解压缩
            GZIPInputStream gip = new GZIPInputStream(connection.getInputStream());
            out = new ByteArrayOutputStream();
            //缓冲
            byte []buffer = new byte[1024];
            int len ;
            while((len = gip.read(buffer))!=-1){
                out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }finally{
            //关闭流
            try {
                if(out != null){
                    out.close();
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        //把字节数据转化为字符串返回回去
        return (new String(out.toByteArray(), "utf-8"));
    }

    public static String[] getCity(String data){
        return data.split(",");
    }

    public static void getWeatherToDB(){
        String filePath = "D:\\IDEAprojects\\FuturesTradingSystem\\web\\WEB-INF\\city.txt";
        String[] fileContentList = getGPData.readTxtFile(filePath, 1);
        String fileContent = fileContentList[0];
        String[] city = getCity(fileContent);

        try{
            Connection con = JDBCUtil.getConnection();
            Statement sm = con.createStatement();

            for(int i = 0; i < city.length; i++) {
                String url = "http://wthrcdn.etouch.cn/weather_mini?city=";
                url = url + city[i];
                String data = getWeather(url);
                JSONObject jsonData = new JSONObject(data);
                if (jsonData.getInt("status") == 1000) {
                    JSONArray forecast = jsonData.getJSONObject("data").getJSONArray("forecast");
                    JSONObject today = forecast.getJSONObject(0);
                    JSONObject tomorrow = forecast.getJSONObject(1);
                    String today_fengli = today.getString("fengli");
                    String tomorrow_fengli = tomorrow.getString("fengli");
                    String regex1 = "<!\\[CDATA\\[";
                    String regex2 = "\\]\\]>";
                    today_fengli = today_fengli.replaceAll(regex1, "");
                    today_fengli = today_fengli.replaceAll(regex2, "");
                    tomorrow_fengli = tomorrow_fengli.replaceAll(regex1, "");
                    tomorrow_fengli = tomorrow_fengli.replaceAll(regex2, "");
                    String sql = "replace into weather(city, date, high, low, fengxiang, tomorrow_date, tomorrow_high, tomorrow_low, tomorrow_fengxiang) values('" + city[i] + "'" +
                            ",'" + today.getString("date") + "','" + today.getString("high") + "','" + today.getString("low") + "'" +
                            ",'" + today.getString("fengxiang") + today_fengli + "','" + tomorrow.getString("date") + "','" + tomorrow.getString("high") + "'" +
                            ",'" + tomorrow.getString("low") + "','" + tomorrow.getString("fengxiang") + tomorrow_fengli + "')";
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
