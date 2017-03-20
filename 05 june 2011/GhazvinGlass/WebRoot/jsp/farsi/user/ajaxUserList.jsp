<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="ams.ggc.common.User.UserENT"%>
<%@page import="ams.ggc.common.tools.SecurityUtil"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/calendar/JsFarsiCalendar.js" ></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	  <link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
</head>
  <body>
	  <bean:define id="totalRows" name="userLST" property="totalItems" type="java.lang.Integer"></bean:define>
	  <bean:define id="currentPage" name="userLST" property="currentPage" type="java.lang.Integer"></bean:define>
	  <bean:define id="pageSize" name="userLST" property="pageSize" type="java.lang.Integer"></bean:define>
	  <input type="hidden" value="dlgUserList_content_ajax" id="pagingAjaxContainer">
	  <ams:ajaxPaginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
		<form action="user.do" method="post" id="listForm">
		 <table align="center" class="formTable">
   			<tr>
				<th >
					جستجو:
				</th>
				<td><html:text property="keyword" name="userLST"></html:text>
				</td>
				<td onclick="goToSearchUser();" style="cursor: pointer;">
					<img  src="images/buttons/search.png"></img>
				</td>
			</tr>
   		</table>
	    <table align="center" dir="rtl" class="dataList">
	    	<tr>
	    		<th>
	    			<input type="hidden" name="reqCode" id="reqCode" value="userList4Order" >
	    			<input type="hidden" name="language" value="farsi" >
	    		</th>
	    		<th align="center">
	    			ردیف
	    		</th>
	    		<th align="center" nowrap>
	    			نام کاربری
	    		</th>
	    	</tr>
			<logic:iterate id="userList" property="userENTs" type="ams.ggc.common.User.UserENT" name="userLST" indexId="rowId">
				<tr class="listData">
					<td width="10" align="center">
						<input type="radio" value="<%=userList.getUserName() %>" name="user" class="userRadio">
					</td>
		    		<td width="15" align="center">
		    			<%=(currentPage - 1) * 10 + rowId+1%>
		    		</td>
		    		<td align="center">
		    			<%=userList.getUserName() %>
		    		</td>
		    	</tr>    
	    	</logic:iterate>
	    </table>
	</form>
    </ams:ajaxPaginate>
  </body>
</html>

