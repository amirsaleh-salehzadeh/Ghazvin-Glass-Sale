<%@ page language="java" import="java.util.*"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="tiles"  uri="http://jakarta.apache.org/struts/tags-tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="css/common.css" type="text/css" rel="stylesheet" />
	<title><tiles:getAsString name="title" /></title>  
</head>
  <body bgcolor="white" dir="rtl">
    <table border="0" width="1024" align="center" cellpadding="0" cellspacing="0">
    	<tr>
    		<td colspan="2" align="left">
	    		<br/>
	    		<br/>
    			<a href="t_requestForPage.do?reqCode=farsi" ><img title="بازگشت به خانه" id="mainLogo" style="border: none;" src="images/logoFa.png"></img></a>
    		</td>
    	</tr>
    	<tr>
    		<td valign="top">
    			<table align="center" width="240">
    				<tr>
    					<td>
    						<tiles:insert attribute="functionMenu" />	
    					</td>
    				</tr>
    			</table>
    		</td>
    		<td valign="top" width="100%" align="center" >
	  			<table cellpadding="0" cellspacing="0" width="100%">
	  				<tr >
						<td nowrap="nowrap" align="left" id="menuTD" height="55">
							<br/>
							<tiles:insert attribute="menu" />
							
						</td>    				
	  				</tr>
	  				<tr>
			    		<td id="mainTD" align="center" >
			    		<br/>
			    			<div id="mainBody" style="z-index: 100"><tiles:insert attribute="body" /></div>
			    		</td>    				
	  				</tr>
	  			</table>
  			</td>
    	</tr>
    </table>
  </body>
</html>
