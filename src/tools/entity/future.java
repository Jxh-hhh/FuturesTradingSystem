package tools.entity;

public class future {
    private String future_id;
    private String future_name;
    private String future_price_today;
    private String future_price_yesterday;
    private String future_price_current;
    private String future_price_MAX;
    private String future_price_MIN;

    public String getFuture_id() {
        return future_id;
    }

    public void setFuture_id(String future_id) {
        this.future_id = future_id;
    }

    public String getFuture_name() {
        return future_name;
    }

    public void setFuture_name(String future_name) {
        this.future_name = future_name;
    }

    public String getFuture_price_today() {
        return future_price_today;
    }

    public void setFuture_price_today(String future_price_today) {
        this.future_price_today = future_price_today;
    }

    public String getFuture_price_yesterday() {
        return future_price_yesterday;
    }

    public void setFuture_price_yesterday(String future_price_yesterday) {
        this.future_price_yesterday = future_price_yesterday;
    }

    public String getFuture_price_current() {
        return future_price_current;
    }

    public void setFuture_price_current(String future_price_current) {
        this.future_price_current = future_price_current;
    }

    public String getFuture_price_MAX() {
        return future_price_MAX;
    }

    public void setFuture_price_MAX(String future_price_MAX) {
        this.future_price_MAX = future_price_MAX;
    }

    public String getFuture_price_MIN() {
        return future_price_MIN;
    }

    public void setFuture_price_MIN(String future_price_MIN) {
        this.future_price_MIN = future_price_MIN;
    }

    public future(String future_id, String future_name, String future_price_today, String future_price_yesterday,
                  String future_price_current, String future_price_MAX, String future_price_MIN){
        this.future_id = future_id;
        this.future_name = future_name;
        this.future_price_yesterday = future_price_yesterday;
        this.future_price_current = future_price_current;
        this.future_price_today = future_price_today;
        this.future_price_MAX = future_price_MAX;
        this.future_price_MIN = future_price_MIN;
    }
}
