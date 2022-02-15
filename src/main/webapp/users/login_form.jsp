<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String loginPass = (String)session.getAttribute("login_pass");
	
	if(loginPass != null) {
		response.sendRedirect("welcome.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#login_box {
		width : 300px;
		padding : 20px;
		border : solid #000 1px;
		border-radius : 10px;
	}
	h1{
		text-align : center;
		font-size : 18px;
		border-bottom : solid 1px #000;
	}
	#login_submit {
		width : 250px;
		heigth : 30px;
		margin: 0 auto;
	}
	#login_submit > input {
		width : 100%;
		display : block;
	}
</style>
</head>
<body>
	<div id="login_box">
		<h1>로그인 창</h1>
		<form action="login_check.jsp" method="post">
			<p>아이디 :  <input type ="text" name = "fId" placeholder="아이디" required></p>
			<p>비밀번호 : <input type ="password" name = "fPw" placeholder="비밀번호" required></p>
			<p id = "login_submit"><input type ="submit" value = "로그인" ></p>
		</form>
		<button><a href = "join_form.jsp">회원가입</a></button>
	</div>
</body>
</html>