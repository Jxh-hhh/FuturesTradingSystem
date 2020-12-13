package deal.enums;

public enum resetPasswordEnum {

    // 枚举的格式   是全部要大写 多个单词 用下划线隔开
    // ctrl + shift + y + x  (大小写转换)
    // 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
    // 让开发开发人员去死记硬背 这些 单词
    USER_ACCOUNT_IS_NUll("账户不能为空！","user_account_is_null"),
    NEW_PASSWORD_IS_NUll("新密码不能为空！","new_password_is_null"),
    RETYPED_PASSWORD_IS_NULL("重新输入的密码不能为空！","retyped_password_is_null"),
    TWO_PASSWORDS_ARE_UNEQUAL("两次输入的密码不相同！","two_passwords_are_unequal"),
    RESET_PASSWORD_IS_SUCCESS("更改密码成功！","reset_password_is_success"),
    RESET_PASSWORD_IS_FAILED("更改密码失败！","reset_password_is_failed"),
    VERIFYCODE_IS_NULL("验证码为空！","verifycode_is_null"),
    VERIFYCODE_IS_NOT_CORRECT("验证码不正确！","verifycode_is_not_correct");



    private String value;
    private String desc;
    // 添加构造函数的 快捷键 是 alt + shift + s
    private resetPasswordEnum(String value, String desc) {
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