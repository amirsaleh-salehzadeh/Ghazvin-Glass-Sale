package ams.ggc.common.order;

import ams.ggc.common.product.ProductENT;

public class OrderDetailENT {
	int orderId;
	int productId;
	String amount;
	String Price;
	int orderDetailId;
	String PackingPrice;
	ProductENT productENT = new ProductENT();
	
	public ProductENT getProductENT() {
		return productENT;
	}
	public void setProductENT(ProductENT productENT) {
		this.productENT = productENT;
	}
	public String getPackingPrice() {
		return PackingPrice;
	}
	public void setPackingPrice(String packingPrice) {
		PackingPrice = packingPrice;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public int getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
}
