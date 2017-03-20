<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<style type="text/css">
span {
	font-size: 25px;
	color: #0e3a63;
	cursor: pointer;
	text-align: center;
}

</style>
		<script type="text/javascript">
	$(document).ready(function() {
		$('span').mouseover(function() {
			$(this).css('color', '96a6b1');
		});
		$('span').mouseout(function() {
			$(this).css('color', '0e3a63');
		});
		$('span').click(function() {
			window.location.replace($(this).attr('id'));
		});
	});
</script>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="1024">
			<tr>
				<td align="right" valign="top">
					<jsp:include page="/jsp/farsi/website/productsMenu.jsp"></jsp:include>
				</td>
				<td>
					<table id="Table_01" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2">
								<img
									src="images/products/otherIndustries/other-industries_01.jpg"
									width="474" height="19" alt="">
							</td>
						</tr>
						<tr>
							<td align="center"
								background="images/products/otherIndustries/other-industries_09.jpg">
								<span id="t_requestForPage.do?reqCode=farsiInsultingGlass">پنجره
									های چند جداره</span>
							</td>
							<td align="left">
								<img
									src="images/products/otherIndustries/other-industries_02.jpg"
									width="241" height="137" alt="">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img
									src="images/products/otherIndustries/other-industries_04.jpg"
									width="474" height="12" alt="">
							</td>
						</tr>
						<tr>
							<td align="center"
								background="images/products/otherIndustries/other-industries_09.jpg">
								<span id="t_requestForPage.do?reqCode=farsiTemperedGlass">شیشه
									سکوریت</span>
							</td>
							<td align="left">
								<img
									src="images/products/otherIndustries/other-industries_05.jpg"
									width="241" height="140" alt="">
							</td>

						</tr>
						<tr>
							<td colspan="2">
								<img
									src="images/products/otherIndustries/other-industries_07.jpg"
									width="474" height="12" alt="">
							</td>
						</tr>
						<tr>
							<td align="center"
								background="images/products/otherIndustries/other-industries_09.jpg">
								<span id="t_requestForPage.do?reqCode=farsiLaminatedGlass">شیشه
									لمینیت</span>
							</td>
							<td align="left" >
								<img
									src="images/products/otherIndustries/other-industries_08.jpg"
									alt="">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

