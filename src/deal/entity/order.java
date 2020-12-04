package deal.entity;

import java.io.Serializable;
import java.security.Timestamp;

public class order{
      private String order_OI;
      private String order_FI;
      private String order_OP;
      private String order_NP;
      private String order_CT;
      private int order_NM;
    public order(String orderOI,String orderFI,String orderOP,String orderNP,String orderCT,int orderNM) {
        // TODO Auto-generated constructor stub
        super();
        this.order_OI = orderOI;
        this.order_FI = orderFI;
        this.order_OP = orderOP;
        this.order_NP = orderNP;
        this.order_CT = orderCT;
        this.order_NM = orderNM;
    }
    public order(){
        super();
    }
    public String getorder_OI() {
        return order_OI;
    }
    public void setorder_OI(String order_OI) {
        this.order_OI = order_OI;
    }
    public String getorder_FI() {
        return order_FI;
    }
    public void setorder_FI(String order_FI) {
        this.order_FI = order_FI;
    }
    public String getorder_OP() {
        return order_OP;
    }
    public void setorder_OP(String order_OP) {
        this.order_OP = order_OP;
    }
    public String getorder_NP() {
        return order_NP;
    }
    public void setorder_NP(String order_NP) {
        this.order_NP = order_NP;
    }
    public String getorder_CT() {
        return order_CT;
    }
    public void setorder_CT(String order_CT) {
        this.order_CT = order_CT;
    }
    public int getorder_NM() {
        return order_NM;
    }
    public void setorder_NM(int order_NM) {
        this.order_NM = order_NM;
    }
}