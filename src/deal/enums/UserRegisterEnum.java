package deal.enums;

public enum UserRegisterEnum {
	
	// 枚举的格式   是全部要大写 多个单词 用下划线隔开
	// ctrl + shift + y + x  (大小写转换)
	// 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
	// 让开发开发人员去死记硬背 这些 单词

	USER_REGISTER_NAME_IS_EXIST("该用户名已存在","user_register_name_is_exist"),
	USER_REGISTER_NAME_IS_NULL("注册的用户名不能为空","user_register_name_is_null"),
	USER_REGISTER_PASSWORD_IS_NULL("注册的密码不能为空","user_register_password_is_null"),
	USER_REGISTER_AGAINPASSWORD_IS_DIFFERENT("两次密码不一致","user_register_againpassword_is_different"),
	USER_REGISTER_VALIDATE_CODE_IS_NULL("验证码不能为空","user_register_validate_code_is_null"),
	USER_REGISTER_VALIDATE_CODE_IS_FAIL("验证码错误","user_register_validate_code_is_fail"),
	USER_REGISTER_SUCCESS("注册成功","user_register_success");
	
	private String value;
	private String desc;
	
	private UserRegisterEnum(String value, String desc) {
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