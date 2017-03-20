<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="bean" uri="/WEB-INF/struts-bean.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="js/calendar/JsFarsiCalendar.js" ></script>
  	<script type="text/javascript" src="js/amirsaleh.message.js" ></script>
  	<script type="text/javascript" src="js/jquery.form.js" ></script>
  	<link rel="stylesheet" href="css/calendar.css" type="text/css"></link>
  	<script type="text/javascript">
  		$(document).ready(function(){
  			$('#newsViewDIV').removeClass("draggable");
  		});
  	</script>
  </head>
  <body>
<%if(request.getParameter("reqCode").equalsIgnoreCase("getNews")){ %>
    <table align="center" dir="rtl" class="newsViewTable">
    	<tr>
    		<th valign="top" align="center">
  				<bean:write property="title" name="newsENT"></bean:write>
    		</th>
    		<th valign="top" align="center">
  				<bean:write property="date" name="newsENT" ></bean:write>
    		</th>
    	</tr>
	    <tr>
    		<td colspan="2" valign="top" align="center">
    			<div id="newsViewDIV">
<!--    				<bean:write property="text" name="newsENT"></bean:write>-->
    				<html:textarea property="text" name="newsENT" readonly="true" cols="95" rows="16"></html:textarea>
    			</div>
    		</td>
    	</tr>
    </table>
    <%}else { %>
    <form action="news.do" id="saveEditedForm" method="post">
	    <table align="center" dir="rtl" class="newsViewTable">
	    	<tr>
	    		<th valign="top" align="center">
	  				<html:text property="title" name="newsENT"></html:text>
	  				<html:hidden property="id"  name="newsENT"></html:hidden>
	  				<html:hidden property="language"  name="newsENT"></html:hidden>
	  				<input type="hidden" name="reqCode" value="saveEdited">
	    		</th>
	    		<th valign="top" align="center">
	  				<html:text property="date" name="newsENT" ></html:text>
	    		</th>
	    	</tr>
		    <tr>
	    		<td colspan="2" valign="top" align="right">
	    			<div id="newsViewDIV">
	    			<html:textarea property="text" name="newsENT" cols="60" rows="18"></html:textarea>
	    			</div>
	    		</td>
	    	</tr>
	    </table>
    </form>
    <%} %>
  </body>
</html>
