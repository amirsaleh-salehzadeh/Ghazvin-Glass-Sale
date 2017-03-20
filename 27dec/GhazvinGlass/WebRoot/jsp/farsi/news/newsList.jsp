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
		function saveNews(){
			createTransparentBg4Message();
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
				$('#newsInsertForm').ajaxSubmit(options);
			}catch(e){
				alert(e);
			}
			$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
			$('div#mainBody').load("news.do?reqCode=list&language=farsi");
		}	
		function showDialogNewsEdit(x){
			var loader = "news.do?reqCode=edit&id="+$(x).attr('id');
			showDialog('dlgNewsEdit','center',loader);
		}
		function saveEdited(){
			createTransparentBg4Message();
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
				$('#saveEditedForm').ajaxSubmit(options);
			}catch(e){
				alert(e);
			}
			$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
			$('div#mainBody').load("news.do?reqCode=list&language=farsi");
		}
	  </script>
	  
	  
  </head>
  <body>
	  <bean:define id="totalRows" name="newsLST" property="totalItems" type="java.lang.Integer"></bean:define>
	  <bean:define id="currentPage" name="newsLST" property="currentPage" type="java.lang.Integer"></bean:define>
	  <bean:define id="pageSize" name="newsLST" property="pageSize" type="java.lang.Integer"></bean:define>
	  <table align="center">
  	    	<tr>
	    		<td colspan="6" valign="top" align="right" style="color: #A2D1FB; font-weight: bold; font-size: 14px;">
	    			<form action="t_news.do" id="newsInsertForm" method="post" >
	    				تاریخ:<html:text property="date" name="newsENT" styleId="date"> </html:text><img src="images/calendar/calendarFromDate.gif"  onclick="displayDatePicker('date',this)">
	    				<br/>زبان:<select name="language">
	    						<option value="farsi">فارسی</option>
	 							<option value="arabic">العربیه</option>
	 							<option value="english">English</option>
	    					</select><br/>
	    				تیتر خبر:<br/><html:text property="title" name="newsENT" style="width: 582px;"> </html:text><br/> 
	    				متن خبر:<br/> <html:textarea property="text" name="newsENT" cols="70" rows="15"></html:textarea><br/>
	    				<html:button property=""  value="ارسال خبر" onclick="saveNews()" ></html:button>
	    				<input type="hidden" name="reqCode" id="reqCode" value="save" >
	    			</form>
	    		</td>
	    	</tr>
	  </table>
		  <ams:paginate currentPage="<%=currentPage%>" pageSize="<%=pageSize%>" totalRows="<%=totalRows%>" align="center">
			<form action="news.do?reqCode=list" method="post" id="listForm">
		    <table align="center" dir="rtl" class="dataList">
		    	<tr>
		    		<th>
		    			<input type="hidden" name="reqCode" id="reqCode" value="list" >
		    			<input type="hidden" name="language" value="farsi" >
		    		</th>
		    		<th align="center">
		    			ردیف
		    		</th>
		    		<th align="center">
		    			تاریخ
		    		</th>
		    		<th align="center" width="100%">
		    			تیتر
		    		</th>
		    		<th align="center">
		    			ویرایش
		    		</th>
		    		<th>
		    			حذف
		    		</th>    		
		    	</tr>
				<logic:iterate id="newsList" property="newsENTs" type="ams.ggc.common.NEWS.NewsENT" name="newsLST" indexId="rowId">
					<tr class="listData">
						<td width="10">
							<input type="checkbox" id="<%=newsList.getId() %>" name="ids">
						</td>
			    		<td width="15">
			    			<%=(currentPage - 1) * 10 + rowId+1%>
			    		</td>
			    		<td >
			    			<%=newsList.getDate() %>
			    		</td>
			    		<td>
			    			<a id="<%=newsList.getId() %>" onclick="showDialogNews(this)" style="cursor: pointer; text-decoration: none;"><%=newsList.getTitle() %></a>
			    		</td>
			    		<td>
			    			<img id="<%=newsList.getId() %>" onclick="showDialogNewsEdit(this)"  src="images/buttons/edit.png" style="cursor: pointer;"></img>
			    		</td>
			    		<td>
			    			<img id="<%=newsList.getId() %>" onclick="delete(this)"  src="images/buttons/delete.png" style="cursor: pointer;" onclick=""></img>
			    		</td>
			    	</tr>    
		    	</logic:iterate>
		    </table>
		</form>
	    </ams:paginate>
  </body>
</html>
