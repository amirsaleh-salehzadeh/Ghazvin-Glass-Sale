/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package ams.ggc.struts;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sun.net.httpserver.Authenticator.Success;

import ams.ggc.common.User.CompanyUserENT;
import ams.ggc.common.User.RealUserENT;
import ams.ggc.common.User.RoleENT;
import ams.ggc.common.User.UserDAOInterface;
import ams.ggc.common.User.UserENT;
import ams.ggc.common.User.UserLST;
import ams.ggc.common.tools.AMSErrorHandler;
import ams.ggc.common.tools.AMSException;
import ams.ggc.common.tools.NVL;


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
		String success = "";
		String error = "";
		if("confirmUser".equalsIgnoreCase(reqCode)||"saveEdit".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			userENT = getUserENT(request);
			userENT.setIsConfirmed(NVL.getBool(request.getParameter("isConfirmed")));
			try {
				userENT.setPassword(null);
				userENT = getDAO().saveUserENT(userENT);
				success = "عملیات ویرایش با موفقیت انجام گردید";
			} catch (AMSException e) {
				error="خطا در ویرایش";
				e.printStackTrace();
			}
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("edit");
		}
		if("delete".equalsIgnoreCase(reqCode)){
			try {
				getDAO().deleteUser(request.getParameter("id"));
				success = "عملیات حذف با موفقیت انجام گردید";
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
			reqCode = "list";
		}
		if("list".equalsIgnoreCase(reqCode)||"salemng".equalsIgnoreCase(reqCode)){
			UserLST lst = new UserLST();
			if(request.getParameter("page")!=null)
				lst.setCurrentPage(NVL.getInt(request.getParameter("page")));
			try {
				lst = getDAO().getUserLST(lst);
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("userLST", lst);
			af = mapping.findForward("list");
		}else if("getRoles".equalsIgnoreCase(reqCode)||"getRoles4Sale".equalsIgnoreCase(reqCode)){
			ArrayList<RoleENT> ents = new ArrayList<RoleENT>();
			try {
				ents = getDAO().getRolesList();
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			UserENT userENT = new UserENT();
			String username = request.getParameter("id");
			try {
				userENT = getDAO().getUserENT(username);
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("roles", ents);
			request.setAttribute("userENT", userENT);
			af = mapping.findForward("userRoles");
		}else if("saveRoles".equalsIgnoreCase(reqCode)){
			String[] roles = request.getParameterValues("ids");
			String username = request.getParameter("username");
			try {
				getDAO().submitRoles(roles, username);
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("goToEdit".equalsIgnoreCase(reqCode)||"edit".equalsIgnoreCase(reqCode)||"getOperator".equalsIgnoreCase(reqCode)){
			UserENT userENT = new UserENT();
			String username = request.getParameter("id");
			try {
				userENT = getDAO().getUserENT(username);
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("userENT", userENT);
			if("getOperator".equalsIgnoreCase(reqCode))
				af = mapping.findForward("operator");
			else
				af = mapping.findForward("edit");
		} 
		request.setAttribute("error", error);
		request.setAttribute("success", success);
			return af;
	}
	public UserENT getUserENT(HttpServletRequest request){
		UserENT userENT = new UserENT();
		CompanyUserENT companyUserENT = new CompanyUserENT();
		RealUserENT realUserENT = new RealUserENT();
		userENT.setUserName(request.getParameter("userName"));
		if("real".equalsIgnoreCase(request.getParameter("type"))){
			realUserENT.setUserName(userENT.getUserName());
			realUserENT.setName(request.getParameter("realUserENT.name"));
			realUserENT.setAddress(request.getParameter("realUserENT.name"));
			realUserENT.setEmailAddress(request.getParameter("realUserENT.emailAddress"));
			realUserENT.setFamilyName(request.getParameter("realUserENT.familyName"));
			realUserENT.setNationalID(request.getParameter("realUserENT.nationalID"));
			realUserENT.setTel(request.getParameter("realUserENT.tel"));
			realUserENT.setFaxNo(request.getParameter("realUserENT.faxNo"));
			realUserENT.setWebSiteAddress(request.getParameter("realUserENT.webSiteAddress"));
			realUserENT.setAddress(request.getParameter("realUserENT.address"));
			if(request.getParameter("year")!=null)
				realUserENT.setDob(request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"));
			else
				realUserENT.setDob(request.getParameter("realUserENT.dob"));
			realUserENT.setOccupation(request.getParameter("occupation"));
		}else{
			companyUserENT.setUserName(userENT.getUserName());
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
	private static UserDAOInterface getDAO() {
		return ams.ggc.common.orm.SellDAOManager.getUserDAOInterface();
	}
}