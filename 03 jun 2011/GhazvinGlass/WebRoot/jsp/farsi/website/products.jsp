<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<style type="text/css">
span {
	font-size: 25px;
	color: #0e3a63;
	cursor: pointer;
}

#Table_01 td {
	text-align: right;
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
					<table id="Table_01" align="right"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td rowspan="7" valign="top">
								<img src="images/products/mainPage/products_04.jpg"  width="486" height="418" alt="">
							</td>
							<td background="images/products/mainPage/products_03.jpg" width="244" height="61">
								<span id="t_requestForPage.do?reqCode=farsiFloat">شیشه فلوت</span>
							</td>
						</tr>
						<tr>
							<td align="center"
								background="images/products/mainPage/products_06.jpg" width="244" height="62" >
								<span id="t_requestForPage.do?reqCode=farsiColoredSimpleGlass">شیشه رنگی ساده</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_07.jpg" width="244" height="61">
								<span id="t_requestForPage.do?reqCode=farsiSimpleGlass">شیشه شیت ساده</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_08.jpg"
								width="244" height="61">
								<span id="t_requestForPage.do?reqCode=farsiMoshajarGlass">شیشه مشجر</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_09.jpg"
								width="244" height="60">
								<span id="t_requestForPage.do?reqCode=farsiLaminatedGlass">شیشه لمینیت</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_10.jpg"
								width="244" height="62">
								<span id="t_requestForPage.do?reqCode=farsiTemperedGlass">شیشه سکوریت</span>
							</td>
						</tr>
						<tr>
							<td background="images/products/mainPage/products_11.jpg"
								width="244" height="51">
								<span id="t_requestForPage.do?reqCode=farsiInsultingGlass">شیشه دوجداره</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

