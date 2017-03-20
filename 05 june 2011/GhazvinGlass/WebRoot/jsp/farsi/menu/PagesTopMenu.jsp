<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%String reqCode = request.getParameter("reqCode"); %>
		<script type="text/javascript">
			$(document).ready(function(){
				$('.button').each(function(){
					if($(this).attr('href').indexOf($('#reqCode').val()) != -1 && $('#reqCode').val()!="farsi"){
						$(this).parent().attr('background','images/menu/topMenu/THEME_PILKINGTON_09.png');
						$(this).css('color','white');
					}
				});
				$('table#topMenuButtons a').mouseover(function(){
					$(this).css('color','002238');
				});
				$('table#topMenuButtons a').mouseout(function(){
					$(this).css('color','96a6b1');
					if($(this).attr('href').indexOf($('#reqCode').val()) != -1 && $('#reqCode').val()!="farsi"){
						$(this).parent().attr('background','images/menu/topMenu/THEME_PILKINGTON_09.png');
						$(this).css('color','white');
					}
				});
			});
	</script>
		<style type="text/css">
#topMenuButtons a {
	color: #96a6b1;
	font-family: inherit;
	cursor: pointer;
	margin-right: 6px;
	margin-left: 6px;
	font-size: 12pt;
	text-decoration: none;
}
</style>
	</head>
	<body bgcolor="#000">
		<table border="0" cellpadding="0" cellspacing="0" align="center"
			 dir="rtl">
			<tr>
				<td rowspan="2" width="275">
					<img style="cursor: pointer;" src="images/menu/topMenu/THEME_PILKINGTON_02.png" onclick="window.location.replace('t_requestForPage.do?reqCode=farsi');"></img>
				</td>
				<td height="71" colspan="2"></td>
			</tr>
			<tr>
				<input type="hidden" id="reqCode" value="<%=request.getParameter("reqCode") %>">
				<td align="right" width="100%"
					background="images/menu/topMenu/THEME_PILKINGTON_07.png">
					<table cellpadding="0" cellspacing="0" id="topMenuButtons" dir="rtl">
						<tr>
							<td nowrap="nowrap">
								<a class="button" id="aboutUsButton" href="t_requestForPage.do?reqCode=farsiAboutUs">درباره ما</a>
							</td>
							<td>
								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>
							</td>
							<td nowrap="nowrap" >
								<a class="button" href="t_requestForPage.do?reqCode=farsiGallery">گالری تصاویر</a>
							</td>
							<td>
								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>
							</td>
							<td nowrap="nowrap" >
								<a class="button" href="t_requestForPage.do?reqCode=farsiProducts" id="productsButton">محصولات</a>
							</td>
<!--							<td>-->
<!--								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>-->
<!--							</td>-->
<!--							<td>-->
<!--								<a href="t_requestForPage.do?reqCode=farsiGallery">اخبار</a>-->
<!--							</td>-->
<!--							<td>-->
<!--								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>-->
<!--							</td>-->
<!--							<td>-->
<!--								<a href="t_requestForPage.do?reqCode=farsiGallery">نقشه سایت</a>-->
<!--							</td>-->
							<td>
								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>
							</td>
							<td nowrap="nowrap">
								<a class="button" href="t_requestForPage.do?reqCode=farsiContactUs">تماس با ما</a>
							</td>
							<td>
								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>
							</td>
<!--							<td>-->
<!--								<a class="button" href="#" onclick="loadAJAXPage('t_login.do')">ورود</a>-->
<!--							</td>-->
<!--							<td>-->
<!--								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>-->
<!--							</td>-->
<!--							<td>-->
<!--								<a class="button" href="t_register.do">ثبت نام</a>-->
<!--							</td>-->
<!--							<td>-->
<!--								<img src="images/menu/topMenu/THEME_PILKINGTON_06.png"></img>-->
<!--							</td>-->
						</tr>
					</table>
				</td>
				<td align="right">
					<img src="images/menu/topMenu/THEME_PILKINGTON_03.png"></img>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<img src="images/menu/topMenu/THEME_PILKINGTON_08.png"></img>
				</td>
			</tr>
		</table>
	</body>
</html>
