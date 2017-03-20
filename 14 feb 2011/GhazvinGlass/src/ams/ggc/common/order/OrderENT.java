package ams.ggc.common.order;
import java.util.ArrayList;

public class OrderENT {
	String username;
	String dateTime;
	String context;
	String status;
	String operator;
	String totalPrice;
	int orderId;
	ArrayList<OrderDetailENT> detailENTs = new ArrayList<OrderDetailENT>();
	
	public ArrayList<OrderDetailENT> getDetailENTs() {
		return detailENTs;
	}
	public void setDetailENTs(ArrayList<OrderDetailENT> detailENTs) {
		this.detailENTs = detailENTs;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
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
