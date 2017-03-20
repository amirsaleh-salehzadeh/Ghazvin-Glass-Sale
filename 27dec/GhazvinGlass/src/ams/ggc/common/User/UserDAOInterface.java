package ams.ggc.common.User;

import java.util.ArrayList;

import ams.ggc.common.tools.AMSException;


public interface UserDAOInterface {
	public boolean register(UserENT u, String type) throws AMSException;
	public boolean checkUsernameValidity(String userName) throws AMSException;
	public UserLST getUserLST(UserLST lst) throws AMSException;
	public ArrayList<RoleENT> getRolesList() throws AMSException;
	public UserENT getUserENT(String username) throws AMSException;
	public boolean submitRoles(String[] roles, String username) throws AMSException;
	public UserENT confirmUser(UserENT u) throws AMSException;
	public boolean security(String username,String roles) throws AMSException;
}
