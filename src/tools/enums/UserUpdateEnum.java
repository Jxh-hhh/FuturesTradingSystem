package tools.enums;

public enum UserUpdateEnum {

    // 枚举的格式   是全部要大写 多个单词 用下划线隔开
    // ctrl + shift + y + x  (大小写转换)
    // 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
    // 让开发开发人员去死记硬背 这些 单词
    USER_NAME_IS_NULL("用户名不能为空","user_name_is_null"),
    USER_PASSWORD_IS_NULL("用户密码不能为空","user_password_is_null"),
    USER_AUTHORITY_IS_NULL("用户权限不能为空","user_authority_is_null"),
    USER_AUTHORITY_IS_INCORRECT("用户权限不能为该值","user_authority_is_incorrect"),
    USER_UPDATE_IS_SUCCESS("更改用户数据成功","user_authority_is_success"),
    USER_UPDATE_IS_FAILED("更改用户数据失败","user_authority_is_failed");



    private String value;
    private String desc;

    private UserUpdateEnum(String value, String desc) {
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