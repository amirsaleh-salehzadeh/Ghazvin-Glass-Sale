<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" href="css/style.css" type="text/css"	media="screen, projection" />
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection" />
		<script type="text/javascript" language="javascript" src="js/jquery.dropdownPlain.js"></script>
		<script type="text/javascript" language="javascript" src="js/swfobject_modified.js"></script>
		<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
		<script type="text/javascript" src="js/hoverIntent.js"></script>
		<script type="text/javascript" src="js/superfish.js"></script>
		<script type="text/javascript">
			jQuery(function(){
				jQuery('ul.sf-menu').superfish();
			});
		</script>
		<script type="text/javascript">
			function setFlashHeight(divid, newH){
				$("div#"+divid).css("max-height",newH+"px");
				if(newH==="65"){
					$("div#flashContent").css("z-index",-1);
				}
				if(navigator.appName !== "Microsoft Internet Explorer")
					$("#FlashID").height(newH);
			}
			function setFlashSize(divid, newW, newH){
				setFlashHeight(divid, newH);
			}
			function goToPage(x){
				$('div#mainBody').html('<p align="center"><img width="15%" height="15%" src="images/loading.gif" /></p>');
				$('div#mainBody').load($(x).attr('id'));
			}
			$(window).resize(function(){
				$("#flashContent").css("top",$("img#mainLogo").position().top+262);
				$("#flashContent").css("left",$("img#mainLogo").position().left-56);
			});
			$(document).ready(function(){
				$("#flashContent").css("top",$("img#mainLogo").position().top+262);
				$("#flashContent").css("left",$("img#mainLogo").position().left-56);
				$("td#menuTD").mouseover(function(){
					$("div#flashContent").css("z-index",10);
				});
				$("div#flashContent").mouseout(function(){
					$("div#flashContent").css("z-index",-1);
				});
			});
		</script>
		<style type="text/css">
			div#flashContent {
				position: absolute;
			}
		</style>
	</head>
	<body bgcolor="#000">
		<div style="position: absolute; z-index: -1; height: auto;" id="flashContent">
			<object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="600" height="220">
				<param name="movie" value="menu8.swf" />
				<param name="quality" value="high" />
				<param name="wmode" value="transparent" />
				<param name="swfversion" value="6.0.65.0" />
				<!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
				<param name="expressinstall" value="Scripts/expressInstall.swf" />
				<!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="menu8.swf"
					width="600" height="220">
					<!--<![endif]-->
					<param name="quality" value="high" />
					<param name="wmode" value="transparent" />
					<param name="swfversion" value="6.0.65.0" />
					<param name="expressinstall" value="Scripts/expressInstall.swf" />
					<!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
					<div>
		<ul class="sf-menu">
			<li>
				<a href="#">تماس با ما</a>
			</li>
			<li class="current">
				<a href="#a">درباره ما</a>
				<ul>
					<li class="current">
						<a href="#ab">تاریخچه</a>
					</li>
					<li class="current">
						<a href="#ab">گالری تصاویر</a>
					</li>
					<li class="current">
						<a href="#ab">طرح های توسعه</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="#">محصولات</a>
				<ul>
					<li>
						<a href="#">فلوت بی رنگ</a>
					</li>
					<li>
						<a href="#">شیت</a>
						<ul>
							<li><a href="#">شیت ساده</a></li>
							<li><a href="#">شیت مشجر</a></li>
							<li><a href="#">شیت رنگی</a></li>
						</ul>
					</li>
					<li>
						<a href="#">صنایع جانبی</a>
						<ul>
							<li><a href="#">لمینیت - طلقی</a></li>
							<li><a href="#">سکوریت</a></li>
							<li><a href="#">دو جداره</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li>
				<a href="#">تماس با ما</a>
			</li>	
		</ul>
<!--		<h4>-->
<!--							برای دانلود و نصب flash player بر روی تصویر کلیک کنید-->
<!--						</h4>-->
<!--						<p>-->
<!--							<a href="http://www.adobe.com/go/getflashplayer"><img-->
<!--									src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"-->
<!--									alt="Get Adobe Flash player" width="112" height="33" />-->
<!--							</a>-->
<!--						</p>-->
					</div>
					<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>
		<script type="text/javascript">
			swfobject.registerObject("FlashID");
		</script>
	</body>
</html>
