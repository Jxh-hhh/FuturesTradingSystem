package deal.entity;

import java.io.Serializable;
import java.security.Timestamp;

public class User implements Serializable{
	private int userid;
	private String username;
	private String password;
	private Timestamp createtime;
	private String authority;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
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
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public String getAuthority(){return authority;}
	public void setAuthority(String authority){this.authority = authority;}
}
