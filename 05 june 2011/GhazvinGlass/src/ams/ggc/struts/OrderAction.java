/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package ams.ggc.struts;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ams.ggc.common.User.UserDAOInterface;
import ams.ggc.common.User.UserENT;
import ams.ggc.common.order.OrderDAOInterface;
import ams.ggc.common.order.OrderDetailENT;
import ams.ggc.common.order.OrderENT;
import ams.ggc.common.order.OrderLST;
import ams.ggc.common.product.ProductDAOInterface;
import ams.ggc.common.product.ProductENT;
import ams.ggc.common.product.ProductLST;
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
public class OrderAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws AMSException {
		ActionForward af = null;
		String reqCode = request.getParameter("reqCode");
		String error = "";
		String success = "";
		if ("updateDelete".equalsIgnoreCase(reqCode)){
			int orderId = NVL.getInt(request.getParameter("orderId"));
			try {
				getDAO().updateStatus(orderId);
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
			reqCode = "userOrderList";
		}
		if ("delete".equalsIgnoreCase(reqCode)){
			int orderId = NVL.getInt(request.getParameter("orderId"));
			try {
				getDAO().deleteOrder(orderId);
				success = "عملیات حذف با موفقیت انجام گردید";
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
			reqCode = "list";
		}
		if("form".equalsIgnoreCase(reqCode)||"orderPage".equalsIgnoreCase(reqCode)){
			OrderENT ent = new OrderENT();
			try {
				request.setAttribute("productLST", getProductDAO().getProductLST(new ProductLST()));
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
			}
			request.setAttribute("orderENT", ent);
			af = mapping.findForward("form");
		}else if ("list".equalsIgnoreCase(reqCode)||"userOrderList".equalsIgnoreCase(reqCode)){
			OrderLST lst = new OrderLST();
			if(request.getParameter("keyword")!=null)
				lst.setKeyword(request.getParameter("keyword"));
			if("userOrderList".equalsIgnoreCase(reqCode)){
				lst.setPageSize(10);
				lst.setUsername(request.getRemoteUser());
				af=mapping.findForward("myList");
			}else
				af=mapping.findForward("list");
			if(request.getParameter("page")!=null)
				lst.setCurrentPage(NVL.getInt(request.getParameter("page")));
			String mng = "";
			lst.setProductname(mng);
			try {
				lst = getDAO().getOrderLST(lst);
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
			request.setAttribute("orderLST", lst);
		}else if ("confirmation".equalsIgnoreCase(reqCode)||"confirmNew".equalsIgnoreCase(reqCode)){
			OrderENT orderENT = new OrderENT();
			orderENT = this.setOrderENT(request);
			orderENT.setStatus("در انتظار بررسی");
			if("confirmNew".equalsIgnoreCase(reqCode)){
				orderENT.setStatus("در حال بررسی");
				orderENT.setOperator(request.getRemoteUser());
				orderENT.setUsername(request.getParameter("username"));
			}
			request.setAttribute("orderENT", orderENT);
		    success = "تایید سفارش";
			af = mapping.findForward("confirmation");
		}else if("getOrder".equalsIgnoreCase(reqCode)||"getOrderPrint".equalsIgnoreCase(reqCode)||"edit".equalsIgnoreCase(reqCode)){
			OrderENT orderENT = new OrderENT();
			UserENT userENT = new UserENT();
			orderENT.setOrderId(NVL.getInt(request.getParameter("orderId")));
			if(!"getOrderPrint".equalsIgnoreCase(reqCode))
				orderENT.setOperator(request.getRemoteUser());
			try {
				orderENT = getDAO().getOrderENT(orderENT);
				userENT = getUserDAO().getUserENT(orderENT.getUsername());
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
			request.setAttribute("userENT", userENT);
			request.setAttribute("orderENT", orderENT);
			af = mapping.findForward("view");
			if("edit".equalsIgnoreCase(reqCode))
				af = mapping.findForward("edit");
		}else if ("save".equalsIgnoreCase(reqCode)||"saveEdit".equalsIgnoreCase(reqCode)||"saveNew".equalsIgnoreCase(reqCode)){
			OrderENT orderENT = new OrderENT();
			orderENT = this.setOrderENT(request);
			if("save".equalsIgnoreCase(reqCode))
				orderENT.setStatus("در انتظار بررسی");
		    try {
		    	if("save".equalsIgnoreCase(reqCode)||"saveNew".equalsIgnoreCase(reqCode)){
		    		if("saveNew".equalsIgnoreCase(reqCode)){
		    			orderENT.setUsername(request.getParameter("username"));
		    			orderENT.setStatus("در حال بررسی");
		    			orderENT.setOperator(request.getRemoteUser());
		    		}
		    		orderENT = getDAO().saveOrder(orderENT);
		    		success = "ثبت سفارش با موفقیت انجام گردید";
		    	}else{
		    		orderENT.setOrderId(NVL.getInt(request.getParameter("orderId")));
		    		orderENT = getDAO().saveEditOrder(orderENT);
		    		orderENT.setOperator(request.getRemoteUser());
		    		success = "ویرایش سفارش با موفقیت انجام گردید";
		    		request.setAttribute("userENT", getUserDAO().getUserENT(request.getRemoteUser()));
		    	}
				
			} catch (AMSException e) {
				error = AMSErrorHandler.handle(request, this, e, "", "");
				e.printStackTrace();
			}
		    request.setAttribute("orderENT", orderENT);
		    if(!"saveEdit".equalsIgnoreCase(reqCode)){
		    	af = mapping.findForward("confirmation");
		    }else{
		    	af = mapping.findForward("edit");
		    }
		}else if("new".equalsIgnoreCase(reqCode)){
			OrderENT ent = new OrderENT();
			request.setAttribute("orderENT", ent);
			af = mapping.findForward("edit");
		}
		request.setAttribute("error", error);
		request.setAttribute("success", success);
		return af;
	}
	private OrderENT setOrderENT(HttpServletRequest request) {
		OrderENT orderENT = new OrderENT();
		orderENT.setContext(request.getParameter("description"));
		orderENT.setUsername(request.getRemoteUser());
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	    orderENT.setStatus(request.getParameter("status"));
	    if(request.getParameter("dateTime")!=null)
	    	orderENT.setDateTime(request.getParameter("dateTime"));
    	else
	    	orderENT.setDateTime(request.getParameter("date")+" - "+ sdf.format(cal.getTime()));
	    if("saveNew".equalsIgnoreCase(request.getParameter("reqCode")))
    		orderENT.setDateTime(request.getParameter("dateTime")+" - "+ sdf.format(cal.getTime()));	
	    ArrayList<OrderDetailENT> detailENTs = setOrderDetailsENT(request);
	    long totalPrice = 0;
	    for(int i = 0 ; i < detailENTs.size() ; i ++){
	    	totalPrice = totalPrice + NVL.getLong(detailENTs.get(i).getPrice());
	    }
	    orderENT.setTotalPrice(totalPrice+"");
	    orderENT.setDetailENTs(detailENTs);
		return orderENT;
	}
	private ArrayList<OrderDetailENT> setOrderDetailsENT(HttpServletRequest request) {
		ArrayList<OrderDetailENT> orderDetailENTs = new ArrayList<OrderDetailENT>();
		String[] productId = request.getParameterValues("productId");
		String[] amount = request.getParameterValues("detailAmount");
		String[] packing = request.getParameterValues("packingPrice");
		for(int i = 0 ; i < productId.length ; i ++){
			OrderDetailENT ent = new OrderDetailENT();
			ent.setAmount(amount[i]);
			ProductENT pent2 = new ProductENT();
			pent2.setProductId(NVL.getInt(productId[i]));
			ent.setProductId(NVL.getInt(productId[i]));
			ProductENT productENT = new ProductENT();
			try {
				productENT = getProductDAO().getProduct(pent2);
			} catch (AMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ent.setProductENT(productENT);
			long productPrice = NVL.getLong(productENT.getPrice()) * NVL.getInt(amount[i]);
			if(packing[i]!=null&&!packing[i].equalsIgnoreCase("0")){
				ent.setPackingPrice(""+NVL.getInt(amount[i]) * 1500 * productENT.getThickness());
				productPrice = productPrice + NVL.getLong(ent.getPackingPrice());
			}else
				ent.setPackingPrice(""+0);
			
			productPrice = productPrice + (productPrice*3/100);
			ent.setPrice(productPrice+"");
			orderDetailENTs.add(ent);
		}
		return orderDetailENTs;
	}
	private static OrderDAOInterface getDAO() {
		return ams.ggc.common.orm.SellDAOManager.getOrderDAOInterface();
	}
	private static ProductDAOInterface getProductDAO() {
		return ams.ggc.common.orm.SellDAOManager.getProductDAOInterface();
	}
	private static UserDAOInterface getUserDAO() {
		return ams.ggc.common.orm.SellDAOManager.getUserDAOInterface();
	}
}