<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" media="screen" />
		<script src="jquery/NFLightBox.js" type="text/javascript"></script>
</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="1024">
			<tr>
				<td align="right" valign="top">
					<jsp:include page="/jsp/farsi/website/productsMenu.jsp"></jsp:include>
				</td>
				<td>
					<p>
						<span class="pageTitle">شیشه دوجداره</span>
					</p>
					<p>
						شیشه عایق یا دوجداره از پیوستن دو شیشه موازی با هم تشکیل شده که
						میان آنها گاز عایق و یا هوا قرار می گیرد. نمودار و جداول زیر شیوه
						ساخت و بازتاب های نوری و اثرات کاهش صوتی شیشه های عایق یا دوجداره
						را نشان می دهد.
					</p>
					<!--		insulting glass insulting glassinsulting glassinsulting glassinsulting glass insulting glassinsulting glassinsulting glassinsulting glassinsulting glass -->
					<div id="gallery">
						<a href="images/products/insulting1.jpg" title=""> <img
								src="images/products/insulting1s.jpg" style="cursor: pointer;"></img>
						</a>
						<a href="images/products/insulting2.jpg" title=""> <img
								src="images/products/insulting2s.jpg"></img> </a>
						<a href="images/products/insulting3.jpg" title=""> <img
								src="images/products/insulting3s.jpg"></img> </a>
					</div>
					<p>
						<table class="formTable">
							<tr>
								<th align="center" class="formHeader" colspan="2">
									جدول مشخصات تولید
								</th>
							</tr>
							<tr>
								<th>
									بیشترین سایز واحد
								</th>
								<td>
									3210 * 2250 mm
								</td>
							</tr>
							<tr>
								<th>
									کمترین سایز واحد
								</th>
								<td>
									250 * 250 mm
								</td>
							</tr>
							<tr>
								<th>
									بیشترین ضخامت واحد
								</th>
								<td>
									36 mm
								</td>
							</tr>
							<tr>
								<th>
									کمترین ضخامت واحد
								</th>
								<td>
									14 mm
								</td>
							</tr>
							<tr>
								<th>
									کمترین ضخامت شیشه
								</th>
								<td>
									3 mm
								</td>
							</tr>
						</table>
						<script type="text/javascript">
	$(function() {
		var settings = {
			containerResizeSpeed : 300
		};
		$('#gallery a').lightBox(settings);
	});
</script>
				</td>
			</tr>
		</table>
	</body>
</html>
