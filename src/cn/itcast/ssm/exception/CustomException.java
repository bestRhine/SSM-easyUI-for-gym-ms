package cn.itcast.ssm.exception;

/**
 * 	系统自定义异常类型
 * @author YAO
 *
 */
public class CustomException extends Exception {
	
	//异常信息
	private String message;
	
	public CustomException(String message){
		super(message);
		this.message = message;
		
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
