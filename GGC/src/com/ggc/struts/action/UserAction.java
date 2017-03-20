/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ggc.struts.action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ggc.Classes.CompanyUserENT;
import com.ggc.Classes.NewsENT;
import com.ggc.Classes.NewsLST;
import com.ggc.Classes.RealUserENT;
import com.ggc.Classes.RoleENT;
import com.ggc.Classes.UserENT;
import com.ggc.Classes.UserLST;
import com.ggc.Classes.tools.NVL;
import com.ggc.Classes.tools.UTF8;
import com.ggc.business.NewsBusinessManager;
import com.ggc.business.UserBusinessManager;

/** 
 * MyEclipse Struts
 * Creation date: 09-21-2010
 * 
 * XDoclet definition:
 * @struts.action parameter="reqCode" validate="true"
 * @struts.action-forward name="list" path="/jsp/farsi/news/newsList.jsp"
 */
public class UserAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward af = null;
		String reqCode=request.getParameter("reqCode");
		UserBusinessManager businessManager = new UserBusinessManager();
		if("registeration".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("registeration");
		}else if("save".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			userENT = getUserENT(request);
			boolean insertResult = businessManager.register(userENT, request.getParameter("type"));
			request.setAttribute("userENT", userENT);
			if(insertResult)
				af = mapping.findForward("registerationSuccess");
			else
				af = mapping.findForward("registeration");
		}else if("checkValidity".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			userENT = getUserENT(request);
			request.setAttribute("availability", "isNotValid");
			if(businessManager.checkUsernameValidity(userENT.getUserName())){
				request.setAttribute("availability", "isValid");
			}
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("registeration");
		}else if("list".equalsIgnoreCase(reqCode)){
			UserLST lst = new UserLST();
			if(request.getParameter("page")!=null)
				lst.setCurrentPage(NVL.getInt(request.getParameter("page")));
			lst = businessManager.getUserLST(lst);
			request.setAttribute("userLST", lst);
			af = mapping.findForward("list");
		}else if("getRoles".equalsIgnoreCase(reqCode)){
			ArrayList<RoleENT> ents = new ArrayList<RoleENT>();
			ents = businessManager.getRolesList();
			UserENT userENT = new UserENT();
			String username = request.getParameter("id");
			userENT = businessManager.getUserENT(username);
			request.setAttribute("roles", ents);
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("userRoles");
		}else if("saveRoles".equalsIgnoreCase(reqCode)){
			String[] roles = request.getParameterValues("ids");
			String username = request.getParameter("username");
			businessManager.submitRoles(roles, username);
		}else if("goToEdit".equalsIgnoreCase(reqCode)||"edit".equalsIgnoreCase(reqCode)||"getOperator".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			String username = request.getParameter("id");
			userENT = businessManager.getUserENT(username);
			request.setAttribute("userENT", userENT);
			if("getOperator".equalsIgnoreCase(reqCode))
				af = mapping.findForward("operator");
			else
				af = mapping.findForward("edit");
		}else if("confirmUser".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			userENT = getUserENT(request);
			userENT.setConfirmed(NVL.getBool(request.getParameter("isConfirmed")));
			userENT = businessManager.updateUser(userENT);
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("edit");
		}
			return af;
	}
	public UserENT getUserENT(HttpServletRequest request){
		UserENT userENT = new UserENT();
		CompanyUserENT companyUserENT = new CompanyUserENT();
		RealUserENT realUserENT = new RealUserENT();
		userENT.setUserName(request.getParameter("userName"));
		userENT.setPassword(request.getParameter("password"));
		if("real".equalsIgnoreCase(request.getParameter("type"))){
			realUserENT.setName(request.getParameter("realUserENT.name"));
			realUserENT.setAddress(request.getParameter("realUserENT.name"));
			realUserENT.setEmailAddress(request.getParameter("realUserENT.emailAddress"));
			realUserENT.setFamilyName(request.getParameter("realUserENT.familyName"));
			realUserENT.setNationalID(request.getParameter("realUserENT.nationalID"));
			realUserENT.setTel(request.getParameter("realUserENT.tel"));
			realUserENT.setFaxNo(request.getParameter("realUserENT.faxNo"));
			realUserENT.setWebSiteAddress(request.getParameter("realUserENT.webSiteAddress"));
			realUserENT.setAddress(request.getParameter("realUserENT.address"));
			realUserENT.setDob(request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"));
			realUserENT.setOccupation(request.getParameter("occupation"));
		}else{
			companyUserENT.setCompanyName(request.getParameter("companyUserENT.companyName"));
			companyUserENT.setEconomicNumber(request.getParameter("companyUserENT.economicNumber"));
			companyUserENT.setTel(request.getParameter("companyUserENT.tel"));
			companyUserENT.setFaxNo(request.getParameter("companyUserENT.faxNo"));
			companyUserENT.setWebSiteAddress(request.getParameter("companyUserENT.webSiteAddress"));
			companyUserENT.setEmailAddress(request.getParameter("companyUserENT.emailAddress"));
			companyUserENT.setAddress(request.getParameter("companyUserENT.address"));
		}
		userENT.setCompanyUserENT(companyUserENT);
		userENT.setRealUserENT(realUserENT);
		return userENT;
	}
}