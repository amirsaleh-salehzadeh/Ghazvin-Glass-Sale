<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   		
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection"/>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection"/>
		<script type="text/javascript" language="javascript" src="js/jquery.dropdownPlain.js"></script>
		<script type="text/javascript" language="javascript" src="js/swfobject_modified.js"></script>
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
			<style type="text/css">
				div#flashContent {
					position: absolute;
				}
			</style>
	 	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
  </head>
  <body bgcolor="#000">
    <table border="0" cellpadding="0" cellspacing="0">
    	<tr>
    		<td style="display: none;">
    			<ul id="nav" class="dropdown">
					<li class="top">
						<a href="#" id="menu" class="top_link"> <span class="down">درباره ما</span> </a>
						<ul class="sub_menu">
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
						<ul class="sub_menu">
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
<!--					<li class="top" >-->
<!--						<a href="#" id="menu1" class="top_link" > <span class="down">سفارش</span> </a>-->
<!--						<ul class="sub_menu">-->
<!--							<li>-->
<!--								<a href="t_order.do?reqCode=list"  >مدیریت سفارش</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="t_order.do?reqCode=orderPage"  >سفارش</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="t_order.do?reqCode=userOrderList"  > سفارش های من</a>-->
<!--							</li>-->
<!--						</ul>-->
<!--					</li>-->
<!--					<li class="top" id="liFirstVisit">-->
<!--						<a href="#" id="menu2" class="top_link"> <span class="down">کاربران</span> </a>-->
<!--						<ul class="sub_menu">-->
<!--							<li>-->
<!--								<a href="t_register.do" onclick="" id="" >ثبت نام</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="t_login.do" >ورود</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="t_user.do?reqCode=list" id="" >مدیریت کاربر</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="t_user.do?reqCode=edit&id=<%= request.getRemoteUser() %>" >وبرایش</a>-->
<!--							</li>-->
<!--							<li>-->
<!--								<a href="logOut.do?reqCode=logOut" >خروج</a>-->
<!--							</li>-->
<!--						</ul>-->
<!--					</li>-->
					<li class="top" onclick="goToPage(this);" id="order.do?reqCode=orderPage">
						<a href="#" id="menu3" class="top_link"><span class="down">تماس با ما</span></a>
					</li>
					
				</ul>
				
    		</td>
    		<td>
    			<div style="position:absolute;" id="flashContent">
	           	  <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="600" height="220">
	            	  <param name="movie" value="menu8.swf" />
	            	  <param name="quality" value="high" />
	            	  <param name="wmode" value="transparent" />
	            	  <param name="swfversion" value="6.0.65.0" />
	            	  <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
	            	  <param name="expressinstall" value="Scripts/expressInstall.swf" />
	            	  <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
	            	  <!--[if !IE]>-->
	            	  <object type="application/x-shockwave-flash" data="menu8.swf" width="600" height="220">
	            	    <!--<![endif]-->
	            	    <param name="quality" value="high" />
	            	    <param name="wmode" value="transparent" />
	            	    <param name="swfversion" value="6.0.65.0" />
	            	    <param name="expressinstall" value="Scripts/expressInstall.swf" />
	            	    <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
	            	    <div>
	            	      <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
	            	      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33" /></a></p>
	          	      </div>
	            	    <!--[if !IE]>-->
	          	    </object>
	            	  <!--<![endif]-->
	          	  </object>
	        	</div>
	        	<script type="text/javascript">
					swfobject.registerObject("FlashID");
				</script>
			</td>
    	</tr>
    </table>
  </body>
</html>
