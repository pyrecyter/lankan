package com.model;

public class RepairReqFormClass {


	private String name;
	private String email;
	private String contactNumber;
	private String orderNumber;
	private String reasonForRepair;
	private String priority;
	private String comments;
	private String Date;
	
	
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getReasonForRepair() {
		return reasonForRepair;
	}
	public void setReasonForRepair(String reasonForRepair) {
		this.reasonForRepair = reasonForRepair;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

	
	
}
