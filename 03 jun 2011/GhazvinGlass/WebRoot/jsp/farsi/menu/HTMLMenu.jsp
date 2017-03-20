<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="ams.ggc.common.tools.SecurityUtil"%>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
		<script type="text/javascript" src="js/hoverIntent.js"></script>
		<script type="text/javascript" src="js/superfish.js"></script>
		<script type="text/javascript">
			jQuery(function(){
				jQuery('ul.sf-menu').superfish();
			});
		</script>
	</head>
	<body>
	<%SecurityUtil util = new SecurityUtil();
			
	if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator,salemng,usermng,customer")){ %>
		<ul class="sf-menu">
			<li class="current">
				<a href="#a">کاربران</a>
				<ul>
					<%
					
					if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator,usermng")){ %>
						<li>
							<a href="t_user.do?reqCode=list" id="" >مدیریت کاربر</a>
						</li>
					<%} %>
<!--					<li>-->
<!--						<a href="t_user.do?reqCode=edit&id=<%= request.getRemoteUser() %>" >وبرایش</a>-->
<!--					</li>-->
					<li>
						<a href="t_register.do?reqCode=changePasswordView" >تغییر رمز</a>
					</li>
				</ul>
			</li>
			<li class="current">
				<a href="#a">سفارش</a>
				<ul>
					<li>
						<a href="t_order.do?reqCode=form" >سفارش</a>
					</li>
					<li>
						<a href="t_order.do?reqCode=userOrderList"> سفارش های من</a>
					</li>
				</ul>
			</li>
			<%if(util.isUserInRoleByUN(request.getRemoteUser(),"administrator,salemng,usermng")){ %>
				<li class="current">
					<a href="#a">فروش</a>
					<ul>
						<li>
							<a href="t_order.do?reqCode=list">مدیریت سفارش</a>
						</li>
						<li>
							<a href="t_user.do?reqCode=salemng" id="" >مدیریت مشتری</a>
						</li>
						<li>
							<a href="t_product.do?reqCode=list" >مدیریت کالا</a>
						</li>
					</ul>
				</li>
			<%}%>
			<li>
				<a href="logOut.do?reqCode=logOut" >خروج</a>
			</li>
		</ul>
		<%}else{ %>
		<table align="center">
			<tr>
				<td>
					<img src="images/buttons/caution.png"></img>مشتری گرامی با عرض پوزش نام کاربری شما هنوز فعال نگردیده است. لطفا" با واحد بازرگانی شرکت تماس بگیرید.<br/>
					<a href="logOut.do?reqCode=logOut" >برای خروج اینجا کلیک کنید</a>
				</td>
			</tr>
		</table>
		<%} %>
	</body>
</html>