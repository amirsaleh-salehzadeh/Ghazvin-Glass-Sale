package ams.ggc.common.User;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import ams.ggc.common.order.OrderDetailENT;
import ams.ggc.common.order.OrderENT;
import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.AMSUtililies;
import ams.ggc.common.tools.MD5Encryptor;
import ams.ggc.common.tools.NVL;

public class UserDAO extends BaseHibernateDAO implements UserDAOInterface{

	public boolean checkUsernameValidity(String userName) throws AMSException {
		Query q = null;
		try {
			q = getSession().createSQLQuery("select * from user where username = ?");
			q.setString(0, userName);
			if(q.uniqueResult()!=null)
				return false;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<RoleENT> getRolesList() throws AMSException {
		ArrayList<RoleENT> roleENTs = new ArrayList<RoleENT>();
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlGetRoleENT");
			roleENTs = (ArrayList<RoleENT>)q.list();
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}
		return roleENTs;
	}

	public UserENT getUserENT(String username) throws AMSException {
		UserENT ent = new UserENT();
		CompanyUserENT companyUserENT = new CompanyUserENT();
		RealUserENT realUserENT = new RealUserENT();
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlGetUserENT");
			q.setString(0, username);
			ent = (UserENT)q.uniqueResult();
			if(ent!=null){
				if(ent.isCompany){
					q = getSession().getNamedQuery("sqlGetCompanyUserENT");
					q.setString(0, username);
					companyUserENT = (CompanyUserENT)q.uniqueResult();
					ent.setCompanyUserENT(companyUserENT);
					ent.setIsCompany(true);
				}else{
					q = getSession().getNamedQuery("sqlGetRealUserENT");
					q.setString(0, username);
					realUserENT = (RealUserENT)q.uniqueResult();
					ent.setRealUserENT(realUserENT);
					ent.setIsCompany(false);
				}
				q = getSession().getNamedQuery("spGetUserRoles");
				q.setString(0, username);
				ArrayList<UserRoleENT> userRoleENTs = new ArrayList<UserRoleENT>();
				userRoleENTs = (ArrayList<UserRoleENT>)q.list();
				ent.setUserRoleENTs(userRoleENTs);
			}
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}
		return ent;
	}

	public UserLST getUserLST(UserLST lst) throws AMSException {
		ArrayList<UserENT> userENTs = new ArrayList<UserENT>();
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlGetUsersCount");
			int totalItems = NVL.getInt( q.uniqueResult() );
			lst.setTotalItems(totalItems);
			
			q = getSession().getNamedQuery("spGetUsersList");
			q.setString(0, "%"+lst.getKeyword()+"%");
			q.setInteger(1, lst.getFirst());
			q.setInteger(2, lst.getPageSize());
			userENTs = (ArrayList<UserENT>)q.list();
			lst.setUserENTs(userENTs);
			
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}
		return lst;
	}

	public boolean register(UserENT u, String type) throws AMSException {
		Session session = getSession();
		Transaction tx = null;
		try{
			if(getUserENT(u.getUserName()) != null ){
				throw getAMSException("نام کاربری انتخاب شده تکراری و در سیستم موجود می باشد لطفا نام دیگری را انتخاب کنید", null);
			}
			
		tx = session.beginTransaction();
		if("real".equalsIgnoreCase(type)){
			RealUserENT realUserENT = new RealUserENT();
			realUserENT = u.getRealUserENT();
			realUserENT = (RealUserENT)super.saveNoTran(realUserENT, session);
			u.setIsCompany(false);
		}else{
			CompanyUserENT companyUserENT = new CompanyUserENT();
			companyUserENT = u.getCompanyUserENT();
			companyUserENT = (CompanyUserENT)super.saveNoTran(companyUserENT, session);
			u.setIsCompany(true);
		}
		tx.commit();
		session.clear();
		tx = session.beginTransaction();
		session.save(u);
		tx.commit();
		if(u.getPassword()!=null){
			tx = session.beginTransaction();
			UserPassword userPassword = new UserPassword();
			userPassword.setUserPassword(MD5Encryptor.encode(u.getPassword().getUserPassword()));
			userPassword.setUserName(u.getPassword().getUserName());
			u.setPassword(userPassword);
			session.update(u.getPassword());
			tx.commit();
			session.clear();
		}
		session.close();
		} catch (HibernateException ex) {
			tx.rollback();
			session.clear();
			session.close();
			ex.printStackTrace();
			return false;
		}
	return true;
	}

	public boolean security(String username, String roles) throws AMSException {
		String[] role = roles.split(",");
		boolean stmt = false;
		Query q = null;
		try {
			q = getSession().createSQLQuery("SELECT * FROM userrole where username = ? and role = ?");
			for (int i = 0 ; i < role.length ; i ++){
				q.setString(0, username);
				q.setString(1, role[i]);
				if (q.uniqueResult()!=null) {
					stmt = true;
				}
			}
		} catch (HibernateException ex) {
			ex.printStackTrace();
		}	
		return stmt;
	}

	public boolean submitRoles(String[] roles, String username)	throws AMSException {
		Session session = getSession();
		Query q = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			tx.begin();
			q = getSession().createSQLQuery("delete FROM userrole where username = ? ");
			q.setString(0, username);
			q.executeUpdate();
			for (int i = 0 ; i < roles.length ; i ++){
				UserRoleENT roleENT = new UserRoleENT();
				roleENT.setRole(roles[i]);
				roleENT.setUserName(username);
				session.merge(roleENT);
			}
			tx.commit();
			session.close();
		} catch (HibernateException e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return false;
	}

	public UserENT confirmUser(UserENT u, int i) throws AMSException {
		Query q = null;
		try{
			q = getSession().createSQLQuery("update user set isconfirmed = ? where username = ?");
			q.setBoolean(0, u.getIsConfirmed());
			q.setString(1, u.getUserName());
			q.executeUpdate();
		} catch (HibernateException ex) {
			ex.printStackTrace();
			u = null;
		}
		return u;
	}

	public UserENT saveUserENT(UserENT ent) throws AMSException {
		Session session = getSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.merge(ent);
			session.flush();
			if(ent.getPassword()!=null){
				UserPassword userPassword = new UserPassword();
				userPassword.setUserPassword(MD5Encryptor.encode(ent.getPassword().getUserPassword()));
				userPassword.setUserName(ent.getPassword().getUserName());
				ent.setPassword(userPassword);
				session.merge(ent.getPassword());
			}
			session.flush();
		if(!ent.isCompany){
			RealUserENT realUserENT = new RealUserENT();
			realUserENT = ent.getRealUserENT();
			realUserENT = (RealUserENT)session.merge(realUserENT);
		}else{
			CompanyUserENT companyUserENT = new CompanyUserENT();
			companyUserENT = ent.getCompanyUserENT();
			companyUserENT = (CompanyUserENT)session.merge(companyUserENT);
		}
		tx.commit();
		session.clear();
		session.close();
		} catch (HibernateException ex) {
			tx.rollback();
			session.clear();
			session.close();
			ex.printStackTrace();
		}
		return ent;
	}

	public boolean changePassword(UserPassword ent) throws AMSException {
		Query q = getSession().getNamedQuery("sqlGetUserPass");
		q.setString(0, ent.getUserName());
		String olPass = (String) q.uniqueResult(); 
		ent.setOldPassword(AMSUtililies.encode(ent.getOldPassword()));
		ent.setUserPassword(AMSUtililies.encode(ent.getUserPassword()));
		if ("".equals(olPass) || " ".equals(olPass)) {
			throw getAMSException("چنین کاربری وجود ندارد.", null);
		}

		if (!NVL.getString(ent.getOldPassword()).equals(NVL.getString(olPass))) {
			throw getAMSException("کلمه عبور قبلی درست نیست.", null);
		}
		

		Transaction tx = null;
		Session session = getSession();

		try {
			tx = session.beginTransaction();
			q = session.createQuery("update UserPassword set userPassword=? where userName=?");
			q.setString(0, ent.getUserPassword());
			q.setString(1, ent.getUserName());
			q.executeUpdate();
			tx.commit();
		} catch (HibernateException ex) {
				tx.rollback();
			session.close();

			throw getAMSException(AIPEX_SAVE, ex);
		}
		return false;
	}

	public void deleteUser(String username) throws AMSException {
		UserENT ent = this.getUserENT(username);
		Session session = getSession();
		Transaction tx  = null;
	      try{
	    	  tx = session.beginTransaction();
	    	  if(ent.isCompany){
	    		  session.delete(ent.getCompanyUserENT());
	    	  }else{
	    		  session.delete(ent.getRealUserENT());
	    	  }
	    	  for(int i = 0 ; i < ent.getUserRoleENTs().size() ; i ++){
	    		  session.delete(ent.getUserRoleENTs().get(i));
	    	  }
	    	  session.delete(ent);
	    	  tx.commit();
	         session.clear();
	         session.close();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
			session.close();
			throw getAMSException(AIPEX_SAVE , e);
		}
		
	}


}
