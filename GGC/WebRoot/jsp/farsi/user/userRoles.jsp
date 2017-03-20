<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!--	<script type="text/javascript" src="jquery/jquery.js"></script>-->
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
  	<script type="text/javascript" src="js/calendar/JsFarsiCalendar.js" ></script>
  	<script type="text/javascript" src="js/amirsaleh.message.js" ></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
	<script type="text/javascript" src="jquery/ui/ui.core.packed.js"></script>
	<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	  <link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
	  <script type="text/javascript">
		
		$(document).ready(function(){
			var i = $('#roles').val().split(',');
			$('.allRoles').each(function(){
				for (var p = 0 ; p < i.length ; p++){
					if(i[p]===$(this).attr('id'))
						$(this).attr('checked','checked');
				}
			});
		});
	  </script>
	  
	  
  </head>
  <body>
		<form action="user.do" method="post" id="roleListForm">
		<input type="hidden" name="reqCode" value="saveRoles">
		<input type="hidden" name="username" value="<%=request.getParameter("id") %>">
	    <table align="center" dir="rtl" class="dataList">
	   		<tr>
	   			<th colspan="3"> 
	   				نقش ها برای کاربر <%=request.getParameter("id") %>
	   				<%String roles =""; %> 
	   				<logic:iterate id="userRoles" type="com.ggc.Classes.RoleENT" name="userENT" property="roleENTs">
	   					<%roles = roles + userRoles.getEname() + ","; %>
	   				</logic:iterate>
	   				<input type="hidden" value="<%=roles %>" id="roles">
	   			</th>
	   		</tr>
	    	<tr>
	    		<th>
	    			<input type="hidden" name="reqCode" id="reqCode" value="list" >
	    			<input type="hidden" name="language" value="farsi" >
	    		</th>
	    		<th align="center">
	    			ردیف
	    		</th>
	    		<th align="center">
	    			نام نقش
	    		</th>
	    	</tr>
			<logic:iterate id="roleList" type="com.ggc.Classes.RoleENT" name="roles" indexId="rowId">
				<tr class="listData">
					<td width="10">
						<input type="checkbox" id="<%=roleList.getEname() %>" value="<%=roleList.getEname()%>" name="ids" class="allRoles">
					</td>
		    		<td width="15">
		    			<%= rowId+1%>
		    		</td>
		    		<td >
		    			<%=roleList.getFname()%>
		    		</td>
		    	</tr>    
	    	</logic:iterate>
	    </table>
	</form>
  </body>
</html>
