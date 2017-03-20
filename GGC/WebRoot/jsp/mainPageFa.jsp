<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="ams" uri="/WEB-INF/AMSTag.tld" %>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<script type="text/javascript" src="jquery/jquery.js"></script>
	<script type="text/javascript" src="js/clock/excanvas.js"></script> 
	<script type="text/javascript" src="js/clock/coolclock.js"></script> 
	<script type="text/javascript" src="js/clock/moreskins.js"></script> 
	<script type="text/javascript" src="js/calendar/calendar.js"></script>
	<script type="text/javascript" src="js/calendar/lang/calendar-fa.js"></script>
	<script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar/jalali.js"></script>
	
	<script type="text/javascript" src="jquery/ui/ui.core.packed.js"></script>
	<script type="text/javascript" src="jquery/ui/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="tools/dialog/amsdialog.js"></script>
	
	<link href="css/dialogStyles.css" type="text/css" rel="stylesheet" />
	<link href="css/common.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="all" href="js/calendar/skins/aqua/theme.css" title="Aqua" />
	<script type="text/javascript">
		$(document).ready(function(){
			CoolClock.findAndCreateClocks();
		});
	</script>
	<title>شرکت  شیشه قزوین</title>
  </head>
  <body dir="LTR" bgcolor="#A7C8FE" background="images/BG.gif">
    <table border="0" width="1024" align="center" cellpadding="0" cellspacing="0">
    	<tr>
    		<td colspan="2">
    			<a href="requestForPage.do?lang=farsi" ><img style="border: none;" src="images/Banner.jpg"></img></a>
    		</td>
    	</tr>
    	<tr>
    		<td align="right" valign="top">
    			<table cellpadding="0" dir="rtl" cellspacing="0" align="right" width="100%" height="100%">
    				<tr>
						<td>
							<jsp:include page="/jsp/MenuFa.jsp"></jsp:include>
						</td>    				
    				</tr>
    				<tr>
			    		<td width="100%" id="tdMainBody"  style="border: double;" background="images/BG-body.gif">
			    			<div id="mainBody"></div>
			    		</td>    				
    				</tr>
    			</table>
    		</td>
    		<td width="60" valign="top" align="right">
    			<table align="right">
    				<tr>
    					<td bgcolor="#001A43" align="center">
    						<div id="loginDIV"></div>
    					</td>
    				</tr>
    				<tr>
    					<td>
							<div id="newsDIV"></div>
						</td>   				
    				</tr>
    				<tr>
						<td align="center"><canvas id="clk1" class="CoolClock:securephp"></canvas></td>    				
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
    		</td>
    	</tr>
    </table>
  </body>
</html>
