package ams.ggc.common.product;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ams.ggc.common.order.OrderENT;
import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.AMSUtililies;
import ams.ggc.common.tools.NVL;


public class ProductDAO extends BaseHibernateDAO implements ProductDAOInterface{

	public void deleteProductENT(int productId) throws AMSException {
		ProductENT ent = new ProductENT();
		ent.setProductId(productId);
		getSession().beginTransaction().begin();
		getSession().delete(ent);
		getSession().beginTransaction().commit();
		getSession().clear();
		getSession().close();
		
	}

	public ProductENT getProduct(ProductENT productENT) throws AMSException {
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlGetProductENT");
			q.setInteger(0, productENT.getProductId());
			productENT = (ProductENT)q.uniqueResult();
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}
		return productENT;
	}

	public ProductLST getProductLST(ProductLST lst) throws AMSException {
		ArrayList<ProductENT> productENTs = new ArrayList<ProductENT>();
		Query q = null;
		try{
			q = getSession().getNamedQuery("spGetProductsTotalItems");
			int totalItems = NVL.getInt( q.uniqueResult() );
			lst.setTotalItems(totalItems);
			q = getSession().getNamedQuery("spGetProductList");
			q.setInteger(0, lst.getFirst());
			q.setInteger(1, lst.getPageSize());
			productENTs = (ArrayList<ProductENT>)q.list();
			lst.setProductENTs(productENTs);
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return lst;
	}

	public ProductENT saveProduct(ProductENT productENT) throws AMSException {
		Session session = getSession();
		Transaction tx  = null;
		ProductENT ent2 = new ProductENT();
	      try{
	    	 tx = session.beginTransaction();
	         ent2 = (ProductENT) session.merge(productENT);
	         tx.commit();
	         session.clear();
	         session.close();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
			throw getAMSException(AIPEX_SAVE , e);
		}
		return ent2;
	}

	public static void main(String[] args) {
//		ProductENT ent = new ProductENT();
//		ent.setColor("color");
//		ent.setDescription("description");
//		ent.setName("name");
//		ent.setPrice("price");
//		ent.setThickness(4);
		ProductDAO dao = new ProductDAO();
//		dao.save(ent);
//		ProductLST lst = new ProductLST(); 
		try {
			ProductENT ent1 = new ProductENT();
			ent1.setProductId(1);
			dao.deleteProductENT(1);
		} catch (AMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
