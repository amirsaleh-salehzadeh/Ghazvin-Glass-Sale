<!--ERRORPAGE-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="ams.ggc.common.tools.NVL"%>

<%@page import="java.net.URLEncoder"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%--    <base href="<%=basePath%>">--%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>اشکال در ورود به سیستم</title>
		<link rel="stylesheet" type="text/css" href="css/aip.menu.css">
		<%if(request.getRemoteUser()!=null){%>
			<script type="text/javascript">
				window.location="t_requestForPage.do?reqCode=farsi&loginError=true";
			</script>
		<%}%>
  </head>
  <body>


	    <div align="center">
	    <font color="red">
  	نام کاربر یا کلمه عبور اشتباه است . لطفا مجددا سعی کنید
  	</font>
  	</div>

    </body>
</html>