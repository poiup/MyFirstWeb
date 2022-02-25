
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String uId = (String)session.getAttribute("login_uid");	
	if(uId == null) {
		response.sendRedirect("login_form.jsp");
	}
/*
	//DB변수
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	String uName="";
	String uEmail="";
	if(uId == null) {
		response.sendRedirect("login_form.jsp");
	}
	try{
		// DB연결
		Class.forName(dbDriver);
		Connection con =  DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 쿼리문
		String rsQuery = "SELECT * FROM userinfo WHERE uid = ?";
		PreparedStatement pstmt = con.prepareStatement(rsQuery);
		pstmt.setString(1, uId);
		ResultSet rs = pstmt.executeQuery();
		// uid = ? 에 맞는 데이터를 가져옴
		rs.next();
		uName = rs.getString(1);
		uEmail = rs.getString(4);
		// 데이터 회수
		con.close();
		pstmt.close();
	} catch(Exception e){
		out.println("오류");
		e.printStackTrace();
	}
*/
	UserDAO uDAO = UserDAO.getInstance();
	UserVO userData = uDAO.getUserData(uId);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#update_box {
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
	
	<!--  update이 경우는 update_check.sjp 로 자료를 보내야 하는데
	보통 정보 수정을 하는 경우는, 미리 회원정보가 form에 기입되어 있는 경우가 많습니다.
	먼저 폼 양식은 아이디없이 비밀번호는 비어있고, name, email은 DB에 있던 정보가 
	채워진 상태로 창이 열리게 만들겠습니다.
	input태그에서 value속성을 이용하면 미리 채워질 값을 지정할수 있습니다. -->
	<div id = "update_box">
		<h1>계정 정보 수정</h1>
		<form action="update_check.jsp" method = "post">
			<h4><%= uId %>님의 정보</h4>
			<p><input type="password"  name = "newPw" placeholder = "비밀번호" required></p>
			<p><input type="text" name = "newName" placeholder = "이름"  value=<%= userData.getuName() %> required></p>
			<p><input type="email" name = "newEmail" placeholder = "이메일" value=<%= userData.getuEmail() %> required></p>
			<input type="submit"  value = "정보 수정">
		</form>
		<button><a href ="welcome.jsp">돌아가기</a></button>
	</div>
</body>
</html>