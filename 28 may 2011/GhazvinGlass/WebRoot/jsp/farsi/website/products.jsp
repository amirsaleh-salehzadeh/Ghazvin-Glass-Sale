<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<style type="text/css">
span {
	font-size: 35px;
	color: #0e3a63;
	cursor: pointer;
}

#Table_01 td {
	text-align: center;
}
</style>
<script type="text/javascript">
			$(document).ready(function(){
				$('span').mouseover(function(){
					$(this).css('color','96a6b1');
				});
				$('span').mouseout(function(){
					$(this).css('color','0e3a63');
				});
				$('span').click(function(){
					window.location.replace($(this).attr('id'));
				});
			});
	</script>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="1024" dir="rtl">
			<tr>
				<td align="right" valign="top">
					<jsp:include page="/jsp/farsi/website/productsMenu.jsp"></jsp:include>
				</td>
				<td>
					<table id="Table_01" align="center" width="800" height="600"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2" valign="bottom">
								<img src="images/products/mainPage/products_01.png" width="800"
									height="30" alt="">
							</td>
						</tr>
						<tr>
							<td rowspan="7">
								<img src="images/products/mainPage/products_03.png" width="316"
									height="540" alt="">
							</td>
							<td background="images/products/mainPage/products_02.png"
								width="484" height="79">
								<span id="t_requestForPage.do?reqCode=farsiFloat">شیشه فلوت</span>
							</td>

						</tr>
						<tr>
							<td align="center"
								background="images/products/mainPage/products_04.png"
								width="484" height="80">
								<span id="t_requestForPage.do?reqCode=farsiColoredSimpleGlass">شیشه رنگی ساده</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_05.png"
								width="484" height="78">
								<span id="t_requestForPage.do?reqCode=farsiSimpleGlass">شیشه شیت ساده</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_06.png"
								width="484" height="79">
								<span id="t_requestForPage.do?reqCode=farsiMoshajarGlass">شیشه مشجر</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_07.png"
								width="484" height="78">
								<span id="t_requestForPage.do?reqCode=farsiLaminatedGlass">شیشه لمینیت</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_08.png"
								width="484" height="80">
								<span id="t_requestForPage.do?reqCode=farsiTemperedGlass">شیشه سکوریت</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_09.png"
								width="484" height="66">
								<span id="t_requestForPage.do?reqCode=farsiInsultingGlass">شیشه دوجداره</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img src="images/products/mainPage/products_10.png" width="800"
									height="30" alt="">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

