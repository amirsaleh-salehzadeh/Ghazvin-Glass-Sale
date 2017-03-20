<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ggc.Classes.tools.UTF8"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="jquery/ui/ui.core.packed.js"></script>
	<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	<script type="text/javascript">
		function goToNews(){
			$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
			$('div#mainBody').load('news.do?reqCode=list&language=farsi');
		}
		function showDialogNews(x){
			var loader = "news.do?reqCode=getNews&id="+$(x).attr('id');
			showDialog('dlgNews','center',loader);
		}
	</script>
</head>
  <body dir="rtl">
  	  <ams:dialog styleId="dlgNews" loader="" toolbar="" title="" style="simple" screenPosition="center" onOKClick="alert(1)" >
	  </ams:dialog>
	  <ams:dialog styleId="dlgNewsEdit" loader="" title="" style="simple" screenPosition="center" onOKClick="saveEdited();" >
	  </ams:dialog>
	<table width="210" dir="rtl" class="dataList">
		<tr>
			<td colspan="2" align="center">
				<h1><a onclick="goToNews();" style="cursor: pointer;">اخبار</a></h1>
			</td>
		</tr>	
		<tr>
			<th>
				تیتر
			</th>
			<th>
				تاریخ	
			</th>
		</tr>			
		<logic:iterate id="miniNewsList" property="newsENTs" type="com.ggc.Classes.NewsENT" name="newsMiniLST">
			<tr>
				<td>
					<a id="<%=miniNewsList.getId() %>" onclick="showDialogNews(this)" style="cursor: pointer; text-decoration: none;">
						<%
							if( miniNewsList.getTitle().length() >= 35 ){
								out.print(miniNewsList.getTitle().substring(0,35)+"...");					
							}
							else{
								
								out.print(miniNewsList.getTitle());
							}
						 %>
					 </a>
				</td>
				<td>
					<%=miniNewsList.getDate() %>
				</td>
			</tr>			
		</logic:iterate>
	</table>
  </body>
</html>
