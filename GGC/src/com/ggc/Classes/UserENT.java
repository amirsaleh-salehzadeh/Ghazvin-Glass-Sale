package com.ggc.Classes;

import java.util.ArrayList;

import com.ggc.Classes.RealUserENT;

public class UserENT {
	String userName;
	String password;
	boolean isCompany = false;
	boolean isConfirmed;
	String date;
	RealUserENT realUserENT = new RealUserENT();
	CompanyUserENT companyUserENT = new CompanyUserENT();
	ArrayList<RoleENT> roleENTs = new ArrayList<RoleENT>();
	
	public ArrayList<RoleENT> getRoleENTs() {
		return roleENTs;
	}
	public void setRoleENTs(ArrayList<RoleENT> roleENTs) {
		this.roleENTs = roleENTs;
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
	public void setConfirmed(boolean isConfirmed) {
		this.isConfirmed = isConfirmed;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isCompany() {
		return isCompany;
	}
	public void setCompany(boolean isCompany) {
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
}
