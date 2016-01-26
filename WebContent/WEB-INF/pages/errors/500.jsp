<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/erorr_style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${msg}</title>
</head>
<body>
	<div>
		<div class="header-title">
			<h1 class="title">${msg}</h1>
		</div>
		<div class="message">
			<P>Server Internal Error</P>
    	    <p>Please back to <a href="${pageContext.request.contextPath }">Home Page</a></p>
		</div>
    			
	</div>
</body>
</html>