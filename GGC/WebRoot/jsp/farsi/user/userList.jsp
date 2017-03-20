<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ggc.Classes.UserENT"%>
<%@page import="com.ggc.business.UserBusinessManager"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
  	<script type="text/javascript" src="js/calendar/JsFarsiCalendar.js" ></script>
  	<script type="text/javascript" src="js/amirsaleh.message.js" ></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
	<script type="text/javascript" src="jquery/ui/ui.core.packed.js"></script>
	<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	  <link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
	  <script type="text/javascript">
		function showDialogRoles(x){
			var loader = "user.do?reqCode=getRoles&id="+$(x).attr('id');
			showDialog('dlgRolesEdit','center',loader);
		}
		function showDialogEditUser(x){
			var loader = "user.do?reqCode=goToEdit&id="+$(x).attr('id');
			showDialog('dlgEditUser','center',loader);
		}
		function confirmRoles(){
			try{
			var options = {
			    success: function(req) {
			        alert("اطلاعات با موفقیت ذخیره شد.");
			        $("#bgDiv4Message").remove();
			    }
			    ,error: function(req){
			    	alert("ذخیره اطلاعات با مشکل مواجه شده است" + req.responseText);
			    	$("#bgDiv4Message").remove();
			    }
			   };
				$('form#roleListForm').ajaxSubmit(options);
			}catch(e){
				alert(e);
			}
		}
		function confirmEditUser(){
			try{
			var options = {
			    success: function(req) {
			        alert("اطلاعات با موفقیت ذخیره شد.");
			        $("#bgDiv4Message").remove();
			    }
			    ,error: function(req){
			    	alert("ذخیره اطلاعات با مشکل مواجه شده است" + req.responseText);
			    	$("#bgDiv4Message").remove();
			    }
			   };
				$('form#userInsertForm').ajaxSubmit(options);
			}catch(e){
				alert(e);
			}
		}
	  </script>
	  
	  
  </head>
  <body>
  <%
			UserENT	userENT = new UserENT();
			UserBusinessManager businessManager = new UserBusinessManager();
			if(request.getSession().getAttribute("loggedInUser")!=null){
				userENT = (UserENT)request.getSession().getAttribute("loggedInUser");
			}else{
				userENT = null;
			}
		 %>
  	  <ams:dialog styleId="dlgRolesEdit" loader="" title="" style="simple" screenPosition="center" onOKClick="confirmRoles()" >
	  </ams:dialog>
	  <ams:dialog styleId="dlgEditUser" loader="" title="" style="simple" screenPosition="center" onOKClick="confirmEditUser()" >
	  </ams:dialog>
	  <bean:define id="totalRows" name="userLST" property="totalItems" type="java.lang.Integer"></bean:define>
	  <bean:define id="currentPage" name="userLST" property="currentPage" type="java.lang.Integer"></bean:define>
	  <bean:define id="pageSize" name="userLST" property="pageSize" type="java.lang.Integer"></bean:define>
	  <ams:paginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
		<form action="" method="post" id="listForm">
	    <table align="center" dir="rtl" class="dataList">
	    	<tr>
	    		<th>
	    			<input type="hidden" name="reqCode" id="reqCode" value="list" >
	    			<input type="hidden" name="language" value="farsi" >
	    		</th>
	    		<th align="center">
	    			ردیف
	    		</th>
	    		<th align="center" nowrap>
	    			نام کاربری
	    		</th>
	    		<th align="center" nowrap>
	    			تاریخ عضویت
	    		</th>
	    		<th align="center" nowrap">
	    			تایید شده
	    		</th>
	    		<th align="center" nowrap>
	    			کاربر حقوقی
	    		</th>
	    		<%if(userENT !=null&&businessManager.security(userENT.getUserName(),"administrator,usermng")){ %>
	    		<th nowrap>
	    			نقش ها
	    		</th>
	    		<%} %>
	    		<th align="center">
	    			ویرایش
	    		</th>
	    		<th>
	    			حذف
	    		</th>    		
	    	</tr>
			<logic:iterate id="userList" property="userENTs" type="com.ggc.Classes.UserENT" name="userLST" indexId="rowId">
				<tr class="listData">
					<td width="10" align="center">
						<input type="checkbox" id="<%=userList.getUserName() %>" name="ids">
					</td>
		    		<td width="15" align="center">
		    			<%=(currentPage - 1) * 10 + rowId+1%>
		    		</td>
		    		<td align="center">
		    			<%=userList.getUserName() %>
		    		</td>
		    		<td align="center">
		    			<%=userList.getDate() %>
		    		</td>
		    		<td align="center">
						<%if(userList.getIsConfirmed()){ %>
							<img id="<%=userList.getUserName() %>" src="images/buttons/confirm.png"></img>
						<%}else{ %>
							<img id="<%=userList.getUserName() %>" src="images/buttons/nconfirm.png"></img>
						<%} %>
		    		</td>
		    		<td align="center">
						<%if(userList.isCompany()){ %>
							<img id="<%=userList.getUserName() %>" src="images/buttons/confirm.png"></img>
						<%}else{ %>
							<img id="<%=userList.getUserName() %>" src="images/buttons/nconfirm.png"></img>
						<%} %>
		    		</td>
		    		<%if(userENT !=null&&businessManager.security(userENT.getUserName(),"administrator,usermng")){ %>
		    		<td align="center">
		    			<img id="<%=userList.getUserName() %>" src="images/buttons/role.png" style="cursor: pointer;" onclick="showDialogRoles(this)"></img>
		    		</td>
		    		<%} if(userENT !=null&&businessManager.security(userENT.getUserName(),"administrator,usermng,floatmng,sheetmng")){ %>
		    		<td align="center">
		    			<img id="<%=userList.getUserName() %>" onclick="showDialogEditUser(this)"  src="images/buttons/edit.png" style="cursor: pointer;"></img>
		    		</td>
		    		<%} %>
		    		<td align="center"	>
		    			<img id="<%=userList.getUserName() %>" onclick="delete(this)"  src="images/buttons/delete.png" style="cursor: pointer;" onclick=""></img>
		    		</td>
		    	</tr>    
	    	</logic:iterate>
	    </table>
	</form>
    </ams:paginate>
  </body>
</html>

