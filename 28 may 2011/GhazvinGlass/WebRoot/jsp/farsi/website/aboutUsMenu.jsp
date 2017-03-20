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
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$('a.buttons').mouseover(function() {
					$(this).css('color', '#fe9a41');
				});
				$('a.buttons').mouseout(function() {
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
					<a class="buttons" href="t_requestForPage.do?reqCode=farsiHistory">تاریخچه</a><br/>
					<a class="buttons" href="t_requestForPage.do?reqCode=farsiDevelopmentPlans">طرح های توسعه</a><br/>
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

