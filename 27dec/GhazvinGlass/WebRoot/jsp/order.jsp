<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
  <head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('div#orderFormDIV').load("order.do?reqCode=form&productName=<%=request.getParameter("productName")%>");
		});
	</script>
  </head>
  
  <body>
    <div id="orderFormDIV"></div>
  </body>
</html>
