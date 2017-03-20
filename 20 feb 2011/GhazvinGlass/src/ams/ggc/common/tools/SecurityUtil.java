package ams.ggc.common.tools;
import java.util.List;
import org.hibernate.Query;

import ams.ggc.common.User.UserRoleENT;
import ams.ggc.common.orm.BaseHibernateDAO;


public class SecurityUtil extends BaseHibernateDAO {
	
	public boolean isUserInRoleByUN(String a_username,String a_rolenames) {
		Query q = getSession().createQuery( "from UserRoleENT where userName=?" );
		q.setString(0, a_username);

		String[] arrRoles = a_rolenames.split(",");
		
		List<UserRoleENT> l = (List<UserRoleENT>) q.list();
		if (l != null) {
			for (int i = 0; i < l.size(); i++) {
				for (int j = 0; j < arrRoles.length; j++) {
					if (l.get(i).getRole().equalsIgnoreCase(arrRoles[j]))
						return true;
				}
			}
		}
		return false;
	}
}
