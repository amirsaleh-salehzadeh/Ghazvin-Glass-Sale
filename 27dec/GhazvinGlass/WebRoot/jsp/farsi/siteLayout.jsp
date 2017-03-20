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
    			<a href="t_requestForPage.do?reqCode=farsi" ><img title="بازگشت به خانه" style="border: none;" src="images/logoFa.png"></img></a>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<table align="center">
    				<tr>
    					<td>
    						<tiles:insert attribute="functionMenu" />	
    					</td>
    				</tr>
    			</table>
    		</td>
    		<td valign="top">
	  			<table cellpadding="0" cellspacing="0" >
	  				<tr>
						<td nowrap="nowrap" align="left">
							<br/>
							<tiles:insert attribute="menu" />
						</td>    				
	  				</tr>
	  				<tr>
			    		<td id="tdMainBody">
			    			<div id="mainBody"><tiles:insert attribute="body" /></div>
			    		</td>    				
	  				</tr>
	  			</table>
  			</td>
    	</tr>
    </table>
  </body>
</html>
