<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	PrintWriter pw = new PrintWriter("input.txt"); 
	pw.print(request.getParameter("id")); 
	pw.flush(); 
	pw.close(); 
%>
<script>
	
	
	console.log(<%= request.getParameter("id") %>);
	//window.location.replace("home.html"); 
</script>
</head>
<body>
</body>
</html>