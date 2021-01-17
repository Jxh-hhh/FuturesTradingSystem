package tools.enums;

public enum UserDeleteEnum {

    // 枚举的格式   是全部要大写 多个单词 用下划线隔开
    // ctrl + shift + y + x  (大小写转换)
    // 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
    // 让开发开发人员去死记硬背 这些 单词
    USER_IS_NON_EXIST("该用户不存在","user_is_non_exist"),
    ORDER_DELETE_SUCCESS("该历史订单删除成功", "order_delete_success"),
    USER_DELETE_FAIL("不能删除管理员(admin)","user_delete_fail"),
    USER_DELETE_SUCCESS("用户删除成功","user_delete_success");

    private String value;
    private String desc;
    // 添加构造函数的 快捷键 是 alt + shift + s
    private UserDeleteEnum(String value, String desc) {
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