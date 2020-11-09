package deal.entity;

import java.io.Serializable;
import java.security.Timestamp;

public class gp{
	private String gp_id;
	private String gp_name;
	private String gp_price;
	private String gp_adn;
	private String gp_ad;
	public gp(String gpId,String gpName,String gpPrice,String gpADN,String gpAD) {
		// TODO Auto-generated constructor stub
		super();
		this.gp_id = gpId;
		this.gp_name = gpName;
		this.gp_price = gpPrice;
		this.gp_adn = gpADN;
		this.gp_ad = gpAD;
	}
	public gp(){
		super();
	}
	public String getgp_id() {
		return gp_id;
	}
	public void setgp_id(String gp_id) {
		this.gp_id = gp_id;
	}
	public String getgp_name() {
		return gp_name;
	}
	public void setgp_name(String gp_name) {
		this.gp_name = gp_name;
	}
	public String getgp_price() {
		return gp_price;
	}
	public void setgp_price(String gp_price) {
		this.gp_price = gp_price;
	}
	public String getgp_adn() {
		return  gp_adn;
	}
	public String getgp_ad() {
		return  gp_ad;
	}
}
