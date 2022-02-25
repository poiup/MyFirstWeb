<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	  String id = request.getParameter("id");
	  String nickname = request.getParameter("nickname");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름은 <%= request.getParameter("id") %></h1>
	<h1>별명은 <%= request.getParameter("nickname") %></h1>
	
	-------------------el식 출력------------------------ <br/>
	이름 : ${param.id }
	별명 : ${param.nickname }
</body>
</html>