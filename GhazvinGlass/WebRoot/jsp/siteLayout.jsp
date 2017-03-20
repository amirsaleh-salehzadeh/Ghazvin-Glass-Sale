<%@ page language="java" import="java.util.*"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="tiles"  uri="http://jakarta.apache.org/struts/tags-tiles" %>
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
<title><tiles:getAsString name="title" /></title>  
</head>
  <body dir="rtl" bgcolor="white">
    <table border="0" width="1024" align="center" cellpadding="0" cellspacing="0">
    	<tr>
    		<td colspan="2">
	    		<br/>
	    		<br/>
    			<a href="t_requestForPage.do?reqCode=farsi" ><img style="border: none;" src="images/logoFa.png"></img></a>
    		</td>
    	</tr>
    	<tr>
    		<td align="right" valign="top" nowrap="nowrap">
    			<table cellpadding="0" dir="rtl" cellspacing="0" align="right">
    				<tr>
						<td nowrap="nowrap">
							<tiles:insert attribute="menu" />
						</td>    				
    				</tr>
    				<tr>
			    		<td id="tdMainBody"  style="border: double;" background="images/BG-body.gif">
			    			<div id="mainBody"><tiles:insert attribute="body" /></div>
			    		</td>    				
    				</tr>
    			</table>
    		</td>
    		<td width="60" valign="top" align="right" >
    			<table align="right" width="100%">
    			<%if(request.getRemoteUser()==null){ %>
    				<tr>
    					<td bgcolor="#001A43" style="font-size: 18; font-weight: bold" align="center" height="50" >
<!--    						<div id="loginDIV"></div>-->
							<a href="t_login.do">ورود به سیستم</a>
    					</td>   				
    				</tr>
    				<%} %>
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
