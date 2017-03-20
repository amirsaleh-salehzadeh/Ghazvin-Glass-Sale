package ams.ggc.common.User;

import java.util.ArrayList;


public class UserENT {
	String userName;
	UserPassword password = new UserPassword();
	boolean isCompany = false;
	boolean isConfirmed;
	String date;
	RealUserENT realUserENT = new RealUserENT();
	CompanyUserENT companyUserENT = new CompanyUserENT();
	ArrayList<UserRoleENT> userRoleENTs = new ArrayList<UserRoleENT>();
	
	public ArrayList<UserRoleENT> getUserRoleENTs() {
		return userRoleENTs;
	}
	public void setUserRoleENTs(ArrayList<UserRoleENT> userRoleENTs) {
		this.userRoleENTs = userRoleENTs;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public boolean getIsConfirmed() {
		return isConfirmed;
	}
	public void setIsConfirmed(boolean isConfirmed) {
		this.isConfirmed = isConfirmed;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(boolean isCompany) {
		this.isCompany = isCompany;
	}
	public RealUserENT getRealUserENT() {
		return realUserENT;
	}
	public void setRealUserENT(RealUserENT realUserENT) {
		this.realUserENT = realUserENT;
	}
	public CompanyUserENT getCompanyUserENT() {
		return companyUserENT;
	}
	public void setCompanyUserENT(CompanyUserENT companyUserENT) {
		this.companyUserENT = companyUserENT;
	}
	public UserPassword getPassword() {
		return password;
	}
	public void setPassword(UserPassword password) {
		this.password = password;
	}
	
}
