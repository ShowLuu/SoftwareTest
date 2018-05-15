package com.uu.ssm.web.controller;

public class ResultBean<T> {
	
	public static final String STATUS_SUCCESS="success";
	public static final String STATUS_FAILED="failed";
	
	private int status;
	private String statusText;
	private String message;
	private T data;
	
	public void success(String message){
		this.status=0;
		this.statusText=STATUS_SUCCESS;
		this.message=message;
	}
	
	public void fail(String message){
		this.status=-1;
		this.statusText=STATUS_FAILED;
		this.message=message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.statusText=STATUS_SUCCESS;
		this.data = data;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStatusText() {
		return statusText;
	}

	public void setStatusText(String statusText) {
		this.statusText = statusText;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
