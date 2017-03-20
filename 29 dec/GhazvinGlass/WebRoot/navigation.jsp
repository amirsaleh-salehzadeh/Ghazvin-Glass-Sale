<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/clock/excanvas.js"></script> 
		<script type="text/javascript" src="js/clock/coolclock.js"></script> 
		<script type="text/javascript" src="js/clock/moreskins.js"></script> 
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="js/calendar/lang/calendar-fa.js"></script>
		<script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
		<script type="text/javascript" src="js/calendar/jalali.js"></script>
	</head>
	<body>
		<table>
			<tr>
				<td align="center">
					<canvas id="clk1" class="CoolClock:securephp"></canvas>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div class="example">
						<div id="flat_calendar_2"></div>
						<script type="text/javascript">
									function dateChanged(calendar) {
										alert(calendar.date.print('Date Changed: %Y/%m/%d', 'jalali'));
									}
									Calendar.setup({
										flat         : "flat_calendar_2",   // id of the input field
					        			dateType	 : 'jalali',
					        			flatCallback : dateChanged,
					        			weekNumbers    : false 
									});
								</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
