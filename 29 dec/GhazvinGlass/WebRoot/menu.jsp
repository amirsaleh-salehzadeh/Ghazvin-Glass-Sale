<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<link rel="stylesheet" type="text/css" href="css/pro_dropdown_2.css" />
		<script src="js/stuHover.js" type="text/javascript"></script>
		<script type="text/javascript">
			function goToPage(x){
				$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
				$('div#mainBody').load($(x).attr('id'));
			}
			$(document).ready(function(){
				$('div#mainBody').load('jsp/farsi/initialPage.jsp');
				$('div#loginDIV').load('login.jsp');
				$('div#newsDIV').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif"/></p>');
				$('div#newsDIV').load('news.do?reqCode=miniList&language=farsi');
			});
		</script>
  </head>
  <body>
    <table border="0" dir="rtl"  cellpadding="0" cellspacing="0">
    	<tr>
    		<td valign="top">
    			<img src="images/menu/menu_right.png"></img>
    		</td>
    		<td class="mainMenu"  background="images/menu/menu_middle.png">
    			<ul id="nav">
						<li class="top" id="liFirstVisit">
							<a href="#" id="menu1" class="top_link"> <span class="down">درباره ما</span> </a>
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
								<li>
									<a href="#" onclick="goToPage(this);" id="jsp/farsi/contact-us.jsp">تماس با ما</a>
								</li>
							</ul>
						</li>
						<li class="top" id="liFirstVisit">
							<a href="#" id="menu1" class="top_link"> <span class="down">محصولات</span> </a>
							<ul class="big">
								<li><a href="#" onclick="goToPage(this);" id="jsp/farsi/float.jsp">فلوت</a>
			    				</li>
			    				<li><a class="fly" href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">شیت</a>
			    					<ul>
			    						<li>
			    							<a href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">مشجر</a>
			    						</li>
			    						<li>
			    							<a href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">ساده</a>
			    						</li>
			    						<li>
			    							<a href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">رنگی</a>
			    						</li>
			    					</ul>
			    				</li>
			    				<li><a class="fly" href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">صنایع جانبی</a>
		    						<ul>
			    						<li>
			    							<a href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">سکوریت</a>
			    						</li>
			    						<li>
			    							<a href="/AIPNIOPDCSellBI/aipbimdx.jsp?reportId=174">لمینت</a>
			    						</li>
			    						<li>
			    							<a href="#" onclick="goToPage(this);" id="jsp/farsi/2jedare.jsp">دو جداره</a>
			    						</li>
			    					</ul>
			    				</li>
							</ul>
						</li>
						<li class="top" id="liFirstVisit">
							<a href="#" id="menu1" class="top_link"> <span class="down">کاربران</span> </a>
							<ul class="big">
								<li>
									<a href="logOut.do?reqCode=logOut" >خروج</a>
								</li>
								<li>
									<a href="#" onclick="goToPage(this);" id="user.do?reqCode=registeration" >ثبت نام</a>
								</li>
								<li>
									<a href="#" onclick="goToPage(this);" id="user.do?reqCode=list" >مدیریت کاربر</a>
								</li>
								<li>
									<a href="#" onclick="goToPage(this);" id="order.do?reqCode=list" >مدیریت سفارش</a>
								</li>
								<li>
									<a href="#" onclick="goToPage(this);" id="jsp/farsi/history.jsp">ورود</a>
								</li>
							</ul>
						</li>
					</ul>
    		</td>
    		<td valign="top">
    			<img src="images/menu/menu_left.png"></img>
    		</td>
    	</tr>
    </table>
  </body>
</html>
