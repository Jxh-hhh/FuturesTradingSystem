package deal.enums;

public enum UserLoginEnum {

	// 枚举的格式   是全部要大写 多个单词 用下划线隔开
		// ctrl + shift + y + x  (大小写转换)
		// 一个功能如果 有涉及到业务场景 那么这个时候 我们就要考虑到封装一个枚举文件 用来记录这些业务场景，而不是
		// 让开发开发人员去死记硬背 这些 单词
		USER_NAME_IS_NUll("用户名不能为空","user_name_is_null"),
		USER_PASSWORD_IS_NULL("密码不能为空","user_password_is_null"),
		USER_NAME_OR_PASSWORD_IS_FAIL("用户名或密码错误","user_name_or_password_is_fail"),
		USER_VALIDATE_CODE_IS_FAIL("验证码错误","user_validate_code_is_fail"),
		USER_LOGIN_SUCCESS("登录成功","user_login_success");
		
		private String value;
		private String desc;
		// 添加构造函数的 快捷键 是 alt + shift + s
		private UserLoginEnum(String value, String desc) {
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