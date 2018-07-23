package com.ys.entity;

import java.util.Date;


public class History {
	private Integer historyId;
	private Date date;
	private String address;
	private String phone;
	private Float allTotal;
	private Integer userId;

	public Integer getHistoryId() {
		return historyId;
	}

	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Float getAllTotal() {
		return allTotal;
	}

	public void setAllTotal(Float allTotal) {
		this.allTotal = allTotal;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
