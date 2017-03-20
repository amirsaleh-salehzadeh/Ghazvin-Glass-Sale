<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="ams.ggc.business.UserBusinessManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<link rel="stylesheet" type="text/css" href="css/pro_dropdown_2.css" />
		<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
		<script type="text/javascript">
			function goToPage(x){
				$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
				$('div#mainBody').load($(x).attr('id'));
			}
			$(document).ready(function(){
				$('div#loginDIV').load('login.do');
				$('div#newsDIV').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif"/></p>');
				$('div#newsDIV').load('news.do?reqCode=miniList&language=farsi');
			});
		</script>
	 	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  </head>
  <body>
    <table border="0" dir="ltr"  cellpadding="0" cellspacing="0">
    	<tr>
    		<td>
    			<ul id="nav">
					<li class="top">
						<a href="#" id="menu" class="top_link"> <span class="down">درباره ما</span> </a>
						<ul class="big">
							<li>
								<a href="#" onclick="goToPage(this);" id="jsp/farsi/history.jsp">تاریخچه</a>
							</li>
							<li>
								<a href="#">گالری تصاویر</a>
							</li>
							<li>
								<a href="#">طرح های توسعه</a>
							</li>
						</ul>
					</li>
					<li class="top" id="liFirstVisit">
						<a href="#" id="menu0" class="top_link"> <span class="down">محصولات</span> </a>
						<ul class="big">
							<li><a href="#" onclick="goToPage(this);" id="jsp/farsi/float.jsp">فلوت بی رنگ </a>
		    				</li>
		    				<li><a class="fly" href="#">شیت</a>
		    					<ul>
		    						<li>
		    							<a href="#">مشجر بی رنگ</a>
		    						</li>
		    						<li>
		    							<a href="#">ساده بی رنگ</a>
		    						</li>
		    						<li>
		    							<a href="#">ساده رنگی</a>
		    						</li>
		    					</ul>
		    				</li>
		    				<li><a class="fly" href="#">صنایع جانبی</a>
	    						<ul>
		    						<li>
		    							<a href="#">سکوریت</a>
		    						</li>
		    						<li>
		    							<a href="#">لمینیت - طلق</a>
		    						</li>
		    						<li>
		    							<a href="#" onclick="goToPage(this);" id="jsp/farsi/2jedare.jsp">دو جداره</a>
		    						</li>
		    					</ul>
		    				</li>
						</ul>
					</li>
					<li class="top" >
						<a href="#" id="menu1" class="top_link" > <span class="down">سفارش</span> </a>
						<ul class="big">
							<li>
								<a href="t_order.do?reqCode=list"  >مدیریت سفارش</a>
							</li>
							<li>
								<a href="t_order.do?reqCode=orderPage"  >سفارش</a>
							</li>
							<li>
								<a href="t_order.do?reqCode=userOrderList"  > سفارش های من</a>
							</li>
						</ul>
					</li>
					<li class="top" id="liFirstVisit">
						<a href="#" id="menu2" class="top_link"> <span class="down">کاربران</span> </a>
						<ul class="big">
							<li>
								<a href="t_register.do" onclick="" id="" >ثبت نام</a>
							</li>
							<li>
								<a href="t_login.do" >ورود</a>
							</li>
							<li>
								<a href="t_user.do?reqCode=list" id="" >مدیریت کاربر</a>
							</li>
							<li>
								<a href="t_user.do?reqCode=edit&id=<%= request.getRemoteUser() %>" >وبرایش</a>
							</li>
							<li>
								<a href="logOut.do?reqCode=logOut" >خروج</a>
							</li>
						</ul>
					</li>
					<li class="top" onclick="goToPage(this);" id="order.do?reqCode=orderPage">
						<a href="#" id="menu3" class="top_link">تماس با ما</a>
					</li>
					
				</ul>
    		</td>
    	</tr>
    </table>
  </body>
</html>
