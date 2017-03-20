package ams.ggc.common.order;

import ams.ggc.common.tools.AMSException;


public interface OrderDAOInterface {
	public OrderLST getOrderLST(OrderLST lst) throws AMSException;
	public OrderENT saveOrder(OrderENT ent) throws AMSException;
	public OrderENT getOrderENT(OrderENT orderENT) throws AMSException;
	public void updateStatus(int orderId) throws AMSException;
	public void deleteOrder(int orderId) throws AMSException;
}
