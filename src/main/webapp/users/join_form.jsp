<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#join_box {
	    width: 300px;
	    margin: 0 auto;
	    border-radius: 10px;
	    border: solid 1px #000;
	    padding-left : 30px
	}
	h1 {
	    width: 100%;
	    line-height: 40px;
	}
	
</style>
</head>
<body>
	<!-- 폼을 만들어주세요. 폼의 목적지는 join_check.jsp입니다. 
	userinfo 테이블에 작성된 대로 아이디, 비밀번호, 이름, 이메일을 가입요소로 받습니다.
	name속성까지 맞춰주시고 submit까지 함께 작성해주세요-->
	<div id = "join_box">
		<h1>계정 만들기</h1>
		<form action="join_check.jsp" method = "post">
			<input type="text" id="uid_input"name = "uid" placeholder = "아이디" required></br>
			<input type="password" id="upw_input" name = "upw" placeholder = "비밀번호" required></br>
			<input type="text" id="uname_input" name = "uname" placeholder = "이름" required></br>
			<input type="email" id="email_input" name = "uemail" placeholder = "이메일" required></br>
			<input type="submit" id="uid_input" value = "회원가입">
		</form>
	</div>
</body>
</html>