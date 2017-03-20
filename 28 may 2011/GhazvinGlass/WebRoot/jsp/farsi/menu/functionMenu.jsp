<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="jquery/jquery.js"></script>
	<script type="text/javascript" src="jquery/accordions/jquery.easing.js"></script>
	<script type="text/javascript" src="jquery/accordions/jquery.dimensions.js"></script>
	<script type="text/javascript" src="jquery/accordions/jquery.accordion.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	<%if(request.getRemoteUser()!=null){ %>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".btn").mouseover(function(){
				$(this).css('background','url("images/menu/rightBTNs1.png") no-repeat');
			});
			$(".btn").mouseout(function(){
				$(this).css('background','url("images/menu/rightBTNs.png") no-repeat');
			});
			jQuery('#list2').accordion({
				event: 'mouseover',
				active: '.selected',
				selectedClass: 'active',
				animated: "bounceslide",
				header: "dt"
			});
		});
	</script>
	<style type="text/css">
		a {
			text-decoration: none;
			color: black;
		}
		fieldset{
			border: none;
		}
		#list2{
			width: 120px;
		}
		.btn{
			background: url("images/menu/rightBTNs.png") no-repeat;
			text-align: center;
			color: black;
			font-weight: bold;
			font-size: 16px;
			height: 40px;
			cursor:pointer;
		}
		dd{
			width: 180;
		}
	</style>
</head>
<body>
	<fieldset>
		<dl id="list2">
				<dl id="list2">
					<dt class="btn">کاربران</dt>
					<dd>
						<ul>
							<li>
								<a href="t_user.do?reqCode=list" id="" >مدیریت کاربر</a>
							</li>
							<li>
								<a href="t_user.do?reqCode=edit&id=<%= request.getRemoteUser() %>" >وبرایش</a>
							</li>
							<li>
								<a href="#" onclick="loadAJAXPage('register.do?reqCode=changePasswordView')" >تغییر رمز</a>
							</li>
						</ul>
					</dd>
					<dt class="btn">سفارش</dt>
					<dd>
						<ul>
							<li>
								<a href="#" onclick="loadAJAXPage('order.do?reqCode=orderPage')">سفارش</a>
							</li>
							<li>
								<a href="t_order.do?reqCode=userOrderList"> سفارش های من</a>
							</li>
						</ul>
					</dd>
					<dt class="btn">فروش</dt>
					<dd>
						<ul>
							<li>
								<a href="t_order.do?reqCode=list">مدیریت سفارش</a>
							</li>
							<li>
								<a href="#">مدیریت مشتری</a>
							</li>
							<li>
								<a href="#" onclick="loadAJAXPage('product.do?reqCode=list');">مدیریت کالا</a>
							</li>
						</ul>
					</dd>
					<a href="logOut.do?reqCode=logOut" ><dt class="btn">خروج</dt></a>
				</dl>
	</fieldset>
</body>
</html>
<%} %>