package deal.sendMail;

import deal.entity.User;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;



public class sendMail extends Thread {
    //用于给用户发送邮件的邮箱
    // PS: 某些邮箱服务器为了增加邮箱本身密码的安全性，给 SMTP 客户端设置了独立密码（有的邮箱称为“授权码”）,
    //    对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。
    private String from = "yuehailin99@163.com";
    //邮箱的用户名
    private String username = "yuehailin99";
    //邮箱的密码
    //    对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。// 发件人邮箱的 SMTP 服务器地址, 必须准确,不同邮件服务器地址不同, 一般(只是一般,绝非绝对)格式为: smtp.xxx.com
    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    private String password = "yuehailin99";
    //发送邮件的服务器地址
    private String host = "smtp.163.com";
    private String verifyCode = "";

    private String mailbox;

    public  sendMail(String mailbox){
        this.mailbox = mailbox;
        verifyCode = createVerifyCode();
    }

    public String getVerifyCode(){
        return this.verifyCode;
    }

    /* 重写run方法的实现，在run方法中发送邮件给指定的用户
     * @see java.lang.Thread#run()
     */
    @Override
    public void run() {
        try{
            Properties prop = new Properties();
            prop.setProperty("mail.host", host);
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            Session session = Session.getInstance(prop);
            session.setDebug(true);
            Transport ts = session.getTransport();
            ts.connect(host, username, password);
            Message message = createEmail(session,mailbox);
            ts.sendMessage(message, message.getAllRecipients());
            ts.close();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private String createVerifyCode(){
        String ret="";
        for(int i = 1;i <= 4; i++){
            int temp = (int)(Math.random()*10.0);
            System.out.println(temp);
            ret += Integer.toString(temp);
        }
        return ret;
    }

    public Message createEmail(Session session, String mailbox) throws Exception{

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailbox));
        message.setSubject("验证码邮件");
        String info = "这是您此次操作的验证码:";
        info += this.verifyCode;
        message.setContent(info, "text/html;charset=UTF-8");
        message.saveChanges();
        return message;
    }
}