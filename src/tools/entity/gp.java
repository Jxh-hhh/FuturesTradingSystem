package tools.entity;

public class gp{
	private String gp_id;
	private String gp_name;
	private String gp_price_today;
	private String gp_price_yesterday;
	private String gp_price_current;
	private String gp_price_MAX;
	private String gp_price_MIN;
	public gp(String gpId,String gpName,String gptPrice,String gpyPrice,String gpcPrice, String gpMAX, String gpMIN) {
		super();
		this.gp_id = gpId;
		this.gp_name = gpName;
		this.gp_price_today = gptPrice;
		this.gp_price_yesterday = gpyPrice;
		this.gp_price_current = gpcPrice;
		this.gp_price_MAX = gpMAX;
		this.gp_price_MIN = gpMIN;
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
	public String getgp_name() { return gp_name; }
	public void setgp_name(String gp_name) {
		this.gp_name = gp_name;
	}
	public String getgp_price_today() {
		return gp_price_today;
	}
	public void setgp_price_today(String gp_price_today) {
		this.gp_price_today = gp_price_today;
	}
	public String getgp_price_yesterday() {
		return  gp_price_yesterday;
	}
	public void setgp_price_yestoday(String gp_price_yestoday) {
		this.gp_price_today = gp_price_yestoday;
	}
	public String getgp_price_current() {
		return gp_price_current;
	}
	public void setgp_price_current(String gp_price_current) {
		this.gp_price_current = gp_price_current;
	}
	public String getgp_price_MAX() {
		return gp_price_MAX;
	}
	public void setgp_price_MAX(String gp_price_MAX) { this.gp_price_MAX = gp_price_MAX; }
	public String getgp_price_MIN() {
		return gp_price_MIN;
	}
	public void gp_price_MIN(String gp_id) {
		this.gp_price_MIN = gp_price_MIN;
	}
}
