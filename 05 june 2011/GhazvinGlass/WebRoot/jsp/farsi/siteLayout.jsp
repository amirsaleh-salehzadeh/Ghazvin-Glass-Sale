<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="tiles"
	uri="http://jakarta.apache.org/struts/tags-tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/ams.site.layout.js"></script>
		<link href="css/common.css" type="text/css" rel="stylesheet" />
		<link rel="shortcut icon" href="images/logoSmallFa.png">
		<title><tiles:getAsString name="title" /></title>
	</head>
	<body bgcolor="white">
		<table cellpadding="0" width="1024" cellspacing="0" align="center" dir="rtl">
			<tr>
				<td>
					<tiles:insert attribute="menu" />
				</td>
			</tr>
			<tr>
				<td id="mainTD" align="center">
					<br />
					<div id="mainBody" style="z-index: 100">
						<tiles:insert attribute="body" />
					</div>
				</td>
			</tr>
			<tr>
				<td id="mainTD" align="center">
					<br />
					<div id="mainBody" style="z-index: 100">
						<tiles:insert attribute="footer" />
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
