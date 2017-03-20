package ams.ggc.common.order;

import ams.ggc.common.User.UserENT;

public class OrderENT {
	String username;
	UserENT userENT = new UserENT(); 
	String dateTime;
	String context;
	String product;
	int orderId;
	String status;
	String operator;
	String size;
	String thickness;
	Boolean packing;
	String totalPrice;

	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Boolean getPacking() {
		return packing;
	}
	public void setPacking(Boolean packing) {
		this.packing = packing;
	}
	public UserENT getUserENT() {
		return userENT;
	}
	public void setUserENT(UserENT userENT) {
		this.userENT = userENT;
	}
	public String getThickness() {
		return thickness;
	}
	public void setThickness(String thickness) {
		this.thickness = thickness;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	String amount;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
}
