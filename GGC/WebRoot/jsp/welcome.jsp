<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>صنایع شیشه ای قزوین</title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
  </head>
  <body background="images/BG.gif">
	<table id="Table_01" width="680" height="510" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="3">
				<img src="images/mainFa/main-page-00_01.jpg" width="680" height="134" alt=""></td>
		</tr>
		<tr>
			<td rowspan="2">
				<img src="images/mainFa/main-page-00_02.jpg" width="448" height="141" alt=""></td>
			<td>
				<img src="images/mainFa/main-page-00_03.jpg" onclick="window.location.replace('requestForPage.do?lang=english');" onmouseover="$(this).attr('src','images/mainFa/main-page-01_03.jpg');" style="cursor: pointer;" onmouseout="$(this).attr('src','images/mainFa/main-page-00_03.jpg');" width="199" height="70" alt=""></td>
			<td rowspan="2">
				<img src="images/mainFa/main-page-00_04.jpg" width="33" height="141" alt=""></td>
		</tr>
		<tr>
			<td>
				<img src="images/mainFa/main-page-00_05.jpg" onclick="window.location.replace('requestForPage.do?lang=farsi');" onmouseover="$(this).attr('src','images/mainFa/main-page-01_05.jpg');" style="cursor: pointer;" onmouseout="$(this).attr('src','images/mainFa/main-page-00_05.jpg');" width="199" height="71" alt=""></td>
		</tr>
		<tr>
			<td colspan="3">
				<img src="images/mainFa/main-page-00_06.jpg" width="680" height="235" alt=""></td>
		</tr>
	</table>
  </body>
</html>
