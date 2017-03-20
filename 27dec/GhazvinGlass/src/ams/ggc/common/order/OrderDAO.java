package ams.ggc.common.order;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.NVL;


public class OrderDAO extends BaseHibernateDAO implements OrderDAOInterface{


	public void deleteOrder(int orderId) throws AMSException {
		OrderENT ent = new OrderENT();
		ent.setOrderId(orderId);
		getSession().delete(ent);
		getSession().clear();
		getSession().close();
	}

	public OrderENT getOrderENT(OrderENT orderENT) throws AMSException {
		Query q = null;
		try {
			if(orderENT.getOperator()!=null){
				q = getSession().getNamedQuery("sqlUpdateStatus");
				q.setString(0, orderENT.getOperator());
				q.setInteger(1, orderENT.getOrderId());
				q.executeUpdate();
			}	
			q = getSession().getNamedQuery("sqlGetOrderENT");
			q.setInteger(0, orderENT.getOrderId());
			orderENT = (OrderENT)q.uniqueResult();
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}
		return orderENT;
	}

	public OrderLST getOrderLST(OrderLST lst) throws AMSException {
			ArrayList<OrderENT> orderENTs = new ArrayList<OrderENT>();
			Query q = null;
			try{
				q = getSession().getNamedQuery("spGetOrdersTotalItems");
				q.setString(0, "%"+lst.getKeyword()+"%");
				q.setString(1, "%"+lst.getProductname()+"%");
				q.setString(2, "%"+lst.getUsername()+"%");
				int totalItems = NVL.getInt( q.uniqueResult() );
				lst.setTotalItems(totalItems);
				q = getSession().getNamedQuery("spGetOrdersList");
				q.setString(0, "%"+lst.getKeyword()+"%");
				q.setString(1, "%"+lst.getProductname()+"%");
				q.setString(2, "%"+lst.getUsername()+"%");
				q.setInteger(3, lst.getFirst());
				q.setInteger(4, lst.getPageSize());
				orderENTs = (ArrayList<OrderENT>)q.list();
				lst.setOrderENTs(orderENTs);
			}catch (HibernateException e) {
				e.printStackTrace();
			}
			return lst;
	}

	public OrderENT saveOrder(OrderENT ent) throws AMSException {
		Session session = getSession();
		Transaction tx  = null;
		OrderENT ent2 = new OrderENT();
	      try{
	    	 tx = session.beginTransaction();
	         ent2 = (OrderENT) session.merge(ent);
	         tx.commit();
	         session.clear();
//	         tx = session.beginTransaction();
//	         int orderId = (Integer)session.createQuery("select max(orderID) from orders").executeUpdate();
//	         ent = (OrderENT)session.get(OrderENT.class,orderId);
//	         session.clear();
//	         session.close();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
			throw getAMSException(AIPEX_SAVE , e);
		}
		return ent2;
	}

	public void updateStatus(int orderId) throws AMSException {
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlUpdateDelStatus");
			q.setInteger(0, orderId);
			q.executeUpdate();
		} catch (HibernateException  ex) {
			ex.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
	OrderDAO dao = new OrderDAO();
	OrderLST lst = new OrderLST();
	try {
		 dao.updateStatus(97);
	} catch (AMSException e) {
		e.printStackTrace();
	}
	System.out.println(lst);
}
}
