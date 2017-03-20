package ams.ggc.common.order;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.product.ProductDAO;
import ams.ggc.common.product.ProductENT;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.NVL;


public class OrderDAO extends BaseHibernateDAO implements OrderDAOInterface{


	public void deleteOrder(int orderId) throws AMSException {
		OrderENT ent = new OrderENT();
		ent.setOrderId(orderId);
		ent = this.getOrderENT(ent);
		Session session = getSession();
		Transaction tx  = null;
	      try{
	    	 tx = session.beginTransaction();
	         ArrayList<OrderDetailENT> orderDetailENTs = new ArrayList<OrderDetailENT>();
	         orderDetailENTs = ent.getDetailENTs();
	         for (int i = 0 ; i < orderDetailENTs.size() ; i++){
	        	 session.delete(orderDetailENTs.get(i));
	         }
	         session.delete(ent);
	         tx.commit();
	         session.clear();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
			throw getAMSException(AIPEX_SAVE , e);
		}
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
			q = getSession().getNamedQuery("sqlGetOrderDetailENT");
			q.setInteger(0, orderENT.getOrderId());
			ArrayList<OrderDetailENT> detailENTs = (ArrayList<OrderDetailENT>)q.list();
			for(int i = 0 ; i < detailENTs.size() ; i ++ ){
				ProductENT productENT = new ProductENT();
				productENT.setProductId(detailENTs.get(i).getProductId());
				productENT = new ProductDAO().getProduct(productENT);
				detailENTs.get(i).setProductENT(productENT);
			}
			orderENT.setDetailENTs(detailENTs);
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
				q.setString(1, "%"+lst.getUsername()+"%");
				int totalItems = NVL.getInt( q.uniqueResult() );
				lst.setTotalItems(totalItems);
				q = getSession().getNamedQuery("spGetOrdersList");
				q.setString(0, "%"+lst.getKeyword()+"%");
				q.setString(1, "%"+lst.getUsername()+"%");
				q.setInteger(2, lst.getFirst());
				q.setInteger(3, lst.getPageSize());
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
	         ArrayList<OrderDetailENT> orderDetailENTs = new ArrayList<OrderDetailENT>();
	         ArrayList<OrderDetailENT> orderDetailENTs2 = new ArrayList<OrderDetailENT>();
	         orderDetailENTs = ent.getDetailENTs();
	         for (int i = 0 ; i < orderDetailENTs.size() ; i++){
	        	 orderDetailENTs.get(i).setOrderId(ent2.getOrderId());
	        	 orderDetailENTs2.add((OrderDetailENT) session.merge(orderDetailENTs.get(i)));
	         }
	         tx.commit();
	         session.clear();
	         ent2.setDetailENTs(orderDetailENTs2);
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
