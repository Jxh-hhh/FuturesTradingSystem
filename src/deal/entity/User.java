package deal.entity;

import java.io.Serializable;
import java.security.Timestamp;

public class User implements Serializable{
	private String userid;
	private String username;
	private String password;
	private String authority;
	private String createtime;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String  getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getAuthority(){return authority;}
	public void setAuthority(String authority){this.authority = authority;}
	public User(String userid,String username,String password,String authority,String createtime){
		super();
		this.userid=userid;
		this.username=username;
		this.password=password;
		this.authority=authority;
		this.createtime=createtime;
	}
	public User(){
		super();
	}
}
