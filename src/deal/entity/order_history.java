package deal.entity;

public class order_history extends order{
    Double yingkui = null;

    public Double getYingkui() {
        return yingkui;
    }

    public void setYingkui(Double yingkui) {
        this.yingkui = yingkui;
    }
    public order_history(String orderOI, String orderFI, String orderON, String orderOP, String orderNP, String orderCT, int orderNM, String username, Double yingkui) {
        // TODO Auto-generated constructor stub
        super(orderOI,orderFI,orderON,orderOP,orderNP,orderCT,orderNM,username);
        this.yingkui = yingkui;
    }
}
