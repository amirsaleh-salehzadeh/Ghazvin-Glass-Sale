<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<style type="text/css">
			a.buttons{
				margin-right: 50px;
				color: #9dacb6;
				text-decoration: none;
				cursor: pointer;
			}
			a.subbuttons{
				margin-right: 60px;
				color: #9dacb6;
				text-decoration: none;
				cursor: pointer;
				border: 4px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("td #productsButton").parent().attr('background','images/menu/topMenu/THEME_PILKINGTON_09.png');
				$("td #productsButton").css('color','white');
				$('a.buttons').each(function(){
					if($(this).attr('href').indexOf($('#reqCode').val()) != -1){
						$(this).css('color','9dacb6');
						$(this).css('font-size','20px');
						$(this).css('border-top','1px solid #9dacb6');
						$(this).css('border-bottom','1px solid #9dacb6');
					}
				});
				$('a.subbuttons').each(function(){
					if($(this).attr('href').indexOf($('#reqCode').val()) != -1){
						$(this).css('color','9dacb6');
						$(this).css('font-size','18px');
						$(this).css('border-top','1px solid #9dacb6');
						$(this).css('border-bottom','1px solid #9dacb6');
					}
				});
				$('a.buttons').mouseover(function() {
					$(this).css('color', '#fe9a41');
				});
				$('a.buttons').mouseout(function() {
					$(this).css('color', '#9dacb6');
				});
				$('a.subbuttons').mouseover(function() {
					$(this).css('color', '#fe9a41');
				});
				$('a.subbuttons').mouseout(function() {
					$(this).css('color', '#9dacb6');
				});
			})
			
		</script>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="240" >
			<tr>
				<td align="right">
					<img src="images/menu/rightMenu/Right-MENU_01.png"></img>
				</td>
			</tr>
			<tr>
				<td align="right" background="images/menu/rightMenu/Right-MENU_03.png" height="100%">
					<a class="buttons" href="t_requestForPage.do?reqCode=farsiFloat">شیشه فلوت</a><br/>
					<a class="buttons" href="t_requestForPage.do?reqCode=farsiSheet">شیشه شیت</a><br/>
					<%String reqCode =request.getParameter("reqCode");
					if("farsiSheet".equalsIgnoreCase(reqCode)||"farsiMoshajarGlass".equalsIgnoreCase(reqCode)||"farsiColoredSimpleGlass".equalsIgnoreCase(reqCode)||"farsiSimpleGlass".equalsIgnoreCase(reqCode)){ %>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiMoshajarGlass">شیشه مشجر</a><br/>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiColoredSimpleGlass"> شیشه رنگی ساده</a><br/>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiSimpleGlass">شیشه شیت ساده</a><br/>
					<%}%>
					<a class="buttons" href="t_requestForPage.do?reqCode=farsiOtherIndustries">صنایع جانبی</a><br/>
					<% if("farsiInsultingGlass".equalsIgnoreCase(reqCode)||"farsiOtherIndustries".equalsIgnoreCase(reqCode)||"farsiLaminatedGlass".equalsIgnoreCase(reqCode)||"farsiTemperedGlass".equalsIgnoreCase(reqCode)){ %>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiLaminatedGlass">شیشه لمینیت</a><br/>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiTemperedGlass">شیشه سکوریت</a><br/>
						<a class="subbuttons" href="t_requestForPage.do?reqCode=farsiInsultingGlass">شیشه دو جداره</a><br/>
					<%} %>
				</td>
			</tr>
			<tr>
				<td align="right">
					<img src="images/menu/rightMenu/Right-MENU_04.png"></img>
				</td>
			</tr>
		</table>
	</body>
</html>

