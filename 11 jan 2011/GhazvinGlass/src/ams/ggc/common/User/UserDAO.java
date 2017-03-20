package ams.ggc.common.User;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import ams.ggc.common.orm.BaseHibernateDAO;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.MD5Encryptor;
import ams.ggc.common.tools.NVL;

public class UserDAO extends BaseHibernateDAO implements UserDAOInterface{

	public boolean checkUsernameValidity(String userName) throws AMSException {
		Query q = null;
		try {
			q = getSession().createQuery("select from UserENT where userName = ?");
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
		ArrayList<UserRoleENT> userRoleENTs = new ArrayList<UserRoleENT>();
		Query q = null;
		try {
			q = getSession().getNamedQuery("sqlGetUserENT");
			q.setString(0, username);
			ent = (UserENT)q.uniqueResult();
			if(ent.isCompany){
				q = getSession().getNamedQuery("sqlGetCompanyUserENT");
				q.setString(0, username);
				companyUserENT = (CompanyUserENT)q.uniqueResult();
				ent.setCompanyUserENT(companyUserENT);
			}else{
				q = getSession().getNamedQuery("sqlGetRealUserENT");
				q.setString(0, username);
				realUserENT = (RealUserENT)q.uniqueResult();
				ent.setRealUserENT(realUserENT);
			}
			q = null;
			q = getSession().getNamedQuery("sqlGetUserRoless");
			q.setString(0, username);
			userRoleENTs = (ArrayList<UserRoleENT>)q.list();
			ent.setUserRoleENTs(userRoleENTs);
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
			SessionFactory fact = new Configuration().configure().buildSessionFactory();
			session = fact.openSession();
			tx = session.beginTransaction();
				session.saveOrUpdate(u);
			if(u.getPassword()!=null){
				UserPassword userPassword = new UserPassword();
				userPassword.setUserPassword(MD5Encryptor.encode(u.getPassword().getUserPassword()));
				userPassword.setUserName(u.getPassword().getUserName());
				u.setPassword(userPassword);
				session.update(u.getPassword());
			}
		if("real".equalsIgnoreCase(type)){
			session.saveOrUpdate(u.getRealUserENT());
		}else{
			session.saveOrUpdate(u.getCompanyUserENT());
		}
		tx.commit();
		session.clear();
		session.close();
		} catch (HibernateException ex) {
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
		try {
			Transaction tx = null;
			tx = session.beginTransaction();
			tx.begin();
			q = getSession().createSQLQuery("delete FROM userrole where username = ? ");
			q.setString(0, username);
			q.executeUpdate();
			q = getSession().createSQLQuery("insert into userrole values (?,?)");
			for (int i = 0 ; i < roles.length ; i ++){
				q.setString(0, username);
				q.setString(1, roles[i]);
				q.executeUpdate();
			}
			tx.commit();
			session.close();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	public UserENT confirmUser(UserENT u) throws AMSException {
		Query q = null;
		try{
			q = getSession().createSQLQuery("update user set isconfirmed = ? where username = ?");
			q.setBoolean(1, u.getIsConfirmed());
			q.setString(2, u.getUserName());
			q.executeUpdate();
		} catch (HibernateException ex) {
			ex.printStackTrace();
			u = null;
		}
		return u;
	}


}
