package ams.ggc.common.NEWS;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.NVL;


public class NewsDAO extends BaseHibernateDAO implements NewsDAOInterface{

	public NewsENT getNewsEnt(int newsId) throws AMSException {
		NewsENT ent = new NewsENT();
		Query q = null;
		try{
			q = getSession().getNamedQuery("sqlGetNewsENT");
			q.setInteger(0, newsId);
			ent = (NewsENT)q.uniqueResult();
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return ent;
	}

	public NewsLST getNewsLST(NewsLST lst) throws AMSException {
		NewsLST newsLST = new NewsLST();
		Query q = null;
		try{
			q = getSession().getNamedQuery("sqlGetNewsCount");
			q.setString(0, lst.getLanguage());
			int totalItems = NVL.getInt( q.uniqueResult() );
			newsLST.setTotalItems(totalItems);

			Calendar calendar = Calendar.getInstance();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
	        if (lst.getDate()== null)
	        	lst.setDate(dateFormat.format(calendar.getTime()));
			q = getSession().getNamedQuery("spGetNewsList");
			q.setString(0,lst.getDate());
			q.setInteger(1, lst.getFirst());
			q.setInteger(2, lst.getPageSize());
			
			ArrayList<NewsENT> newsENTs = (ArrayList<NewsENT>)q.list();
			newsLST.setNewsENTs(newsENTs);
				
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return newsLST;
	}

	public NewsLST getNewsMiniLST(String language) throws AMSException {
		NewsLST newsLST = new NewsLST();
		Query q = null;
		try{
			q = getSession().getNamedQuery("sqlGetNewsMiniList");
			q.setString(0,language);
			ArrayList<NewsENT> newsENTs = (ArrayList<NewsENT>)q.list();
			newsLST.setNewsENTs(newsENTs);
				
		}catch (HibernateException e) {
			e.printStackTrace();
		}
		return newsLST;
	}

	public NewsLST saveNews(NewsENT newsENT) throws AMSException {
		Session session = getSession();
		Transaction tx = null;
		NewsLST lst = new NewsLST();
		try {
//			SessionFactory fact = new Configuration().configure().buildSessionFactory();
//			session = fact.openSession();
			tx = session.beginTransaction();
				session.saveOrUpdate(newsENT);
			tx.commit();
			session.clear();
			session.close();
			lst.setLanguage(newsENT.getLanguage());
			lst = this.getNewsLST(lst);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return lst;
	}
	public static void main(String[] args) {
		NewsDAO dao = new NewsDAO();
		NewsLST lst = new NewsLST();
		NewsENT ent = new NewsENT();
		ent.setDate("date");
		ent.setLanguage("farsi");
		ent.setTitle("titititititle");
		ent.setText("texxxxxxxxxxxxxxxxxxxxxxxxxxxt");
		try {
			lst = dao.getNewsMiniLST("farsi");
		} catch (AMSException e) {
			e.printStackTrace();
		}
		System.out.println(lst);
	}
}
