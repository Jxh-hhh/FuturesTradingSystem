package listener;

import deal.getData.getGPData;
import deal.getData.getWeatherData;

import javax.net.ssl.HandshakeCompletedEvent;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

@WebListener()
public class GetListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {

    // Public constructor is required by servlet spec
    public GetListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed). 
         You can initialize servlet context related data here.
      */
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        calendar.set(year, month, day, 8, 00, 00);
        // 当天8点（默认执行时间）
        Date defaultdate = calendar.getTime();
        Date sendDate = null;
        if (defaultdate.before(new Date())) {
            // 若当前时间超过了defaultdate时间，当天不再执行，则将执行时间sendDate改为明天8点
            calendar.add(Calendar.DATE, 1);
            sendDate = calendar.getTime();
        }else {
            // 若当前时间没有超过defaultdate时间，则将执行时间sendDate改为defaultdate
            sendDate = defaultdate;
        }
        Timer qTimer = new Timer();
        qTimer.schedule(new TimerTask() {

            @Override
            public void run() {
                // TODO 写你的逻辑
                getGPData.getDataToDB("SZA");
                getGPData.getDataToDB("SHA");
                System.out.println("每1min运行一次");
            }
        }, defaultdate,  60 * 1000);// 定时每1min

        Timer hTimer = new Timer();
        hTimer.schedule(new TimerTask() {

            @Override
            public void run() {
                // TODO 写你的逻辑
                getWeatherData.getWeatherToDB();
                System.out.println("每3h运行一次");
            }
        }, defaultdate,  3 * 60 * 60 * 1000);// 定时每3h运行一次
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
        System.out.println("爬取任务暂时休息");
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attribute
         is replaced in a session.
      */
    }
}
