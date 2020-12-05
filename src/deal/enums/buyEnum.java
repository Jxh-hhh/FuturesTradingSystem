package deal.enums;

public enum buyEnum {

    // 枚举的格式   是全部要大写 多个单词 用下划线隔开
    // ctrl + shift + y + x  (大小写转换)
    // 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
    // 让开发开发人员去死记硬背 这些 单词
    BUY_SUCCESS("购买成功","buy_success"),
    NUM_ERROR("输入的订单数必须大于0","num_error"),
    BUY_FAILED("余额不足","buy_failed");

    private String value;
    private String desc;
    // 添加构造函数的 快捷键 是 alt + shift + s
    private buyEnum(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
