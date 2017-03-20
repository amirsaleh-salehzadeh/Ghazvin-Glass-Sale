<%@ page language="java" import="java.util.*"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="tiles"  uri="http://jakarta.apache.org/struts/tags-tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="jquery/jquery.js"></script>
  	<script type="text/javascript" src="js/ams.site.layout.js"></script>
	<link href="css/common.css" type="text/css" rel="stylesheet" />
	<link rel="shortcut icon" href="images/logoSmallFa.png">
	<title><tiles:getAsString name="title" /></title>  
		<%if(request.getRemoteUser()==null){%>
			<script type="text/javascript">
				$(document).ready(function(){
					$('div#loginDIV').load('login.do');
					$('div#footer').load('jsp/farsi/menu/footer.jsp');
					var x =  $(document).height()-$(window).height();
					$("div#footer").css("top",$(document).height()-x+window.pageYOffset-50);
				});
				$(document).scroll(function(){
					var x =  $(document).height()-$(window).height();
					$("div#footer").css("top",$(document).height()-x+window.pageYOffset-50);
				});
			</script>
		<%} %>
		<style type="text/css">
		#footer {
			position:absolute;
			width: 100%;
			color: black;
			font-size: 18px;
		}
		</style>
</head>
  <body bgcolor="white" dir="rtl">
    <table border="0" width="1024" align="center" cellpadding="0" cellspacing="0">
    	<tr>
    		<td colspan="2" align="left">
	    		<br/>
    			<a href="t_requestForPage.do?reqCode=farsi" ><img title="بازگشت به خانه" style="border: none;" src="images/logoFa.png"></img></a>
    		</td>
    	</tr>
    	<%if(request.getRemoteUser()==null){ %>
	    	<tr>
	    		<td colspan="2" align="left">
	    			<br/>
	    			<a href="t_requestForPage.do?reqCode=farsi" ><img title="بازگشت به خانه" id="mainLogo" style="border: none;" src="images/banner.png"></img></a>
	    		</td>
	    	</tr>
    	<%} %>
    	<tr>
    	<%if(request.getRemoteUser()==null){ %>
    		<td valign="top" width="240" align="right">
    			<table align="center" width="240">
    				<tr>
    					<td>
    						<tiles:insert attribute="functionMenu" />	
    					</td>
    				</tr>
    				<tr>
    					<td>
    						<div id="loginDIV"></div>
    					</td>
    				</tr>
    			</table>
    		</td>
   		<%} %>
    		<td valign="top" align="center" >
	  			<table cellpadding="0" cellspacing="0" >
	  				<tr >
						<td nowrap="nowrap" align="left" id="menuTD" height="55">
							<br/>
							<%if(request.getRemoteUser()!=null){ %>
	    						<tiles:insert attribute="HTMLmenu" />
	    					<%}else{ %>
	    						<tiles:insert attribute="menu" />
	    					<%} %>
							
							
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
    <div id="footer">
    </div>
  </body>
</html>
