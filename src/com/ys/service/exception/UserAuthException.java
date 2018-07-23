package com.ys.service.exception;


public class UserAuthException extends Exception{
	//定义不同登录异常
	public static final String USER_PASSWORD_ERROR = "U001"; 
	public static final String USER_NOT_FOUND_ERROR = "U002";
	//注册异常
	public static final String USER_FOUND_ERROR = "U003";
	public static final String PASSWORD_NOT_SAME = "U004";
	public static final String INPUT_NULL = "U005"; 
	
	private String errcode = null;
	private String errmsg = null;
	
	public UserAuthException(String errcode,String errmsg){
		super(errmsg);
		this.errcode=errcode;
		this.errmsg=errmsg;
	}

	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
}
