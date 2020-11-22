package deal.entity;

import java.io.Serializable;
import java.security.Timestamp;

public class usershow{
    private String show_userid;
    private String show_username;
    private String show_password;
    private String show_authority;
    private String show_createTime;
    public usershow(String showUserid,String showUsername,String showPassword,String showAuthority,String showCreateTime) {
        // TODO Auto-generated constructor stub
        super();
        this.show_userid = showUserid;
        this.show_username = showUsername;
        this.show_password = showPassword;
        this.show_authority = showAuthority;
        this.show_createTime = showCreateTime;
    }
    public usershow(){
        super();
    }

    public String getshow_userid() {
        return show_userid;
    }
    public void setshow_userid(String show_userid) {
        this.show_userid = show_userid;
    }
    public String getshow_username() {
        return show_username;
    }
    public void setshow_username(String show_username) {
        this.show_username = show_username;
    }
    public String getshow_password() {
        return show_password;
    }
    public void setshow_password(String show_password) {
        this.show_password = show_password;
    }
    public String getshow_authority() {
        return show_authority;
    }
    public void setshow_authority(String show_authority) {
        this.show_authority = show_authority;
    }
    public String getshow_createTime() {
        return show_createTime;
    }
    public void setshow_createTime(String show_createTime) {
        this.show_createTime = show_createTime;
    }
}
