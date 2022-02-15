<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// DB연결 후, 세션에서 받아온 아이드를 이용해
	// 회원 탈퇴후 body태그 내에는 "아이디 회원의 탈퇴가 완료되었습니다"
	// 출력하고 실제 DB에 DELETE구문을 날려 삭제처리해주세요.
	
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	String uId = (String)session.getAttribute("login_uid");
	
	// 로그인 안했을시 로그인 화면으로
	if(uId == null) {
		response.sendRedirect("login_form.jsp");
	}
	
	try{
		// db지정 및 연결
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 쿼리문 제작
		String memberOutQuery = "DELETE FROM userinfo WHERE uid = ?";
		PreparedStatement pstmt = con.prepareStatement(memberOutQuery);
		pstmt.setString(1, uId);
		
		// 쿼리 실행
		int memberOut = pstmt.executeUpdate();
		session.invalidate();
		out.println("성공적으로 회원탈퇴되었습니다");
		out.println("<button><a href ='login_form.jsp'>로그인화면으로 돌아가기</a></button>");
		pstmt.close();
		con.close();
	} catch(Exception e){
		e.printStackTrace();
		out.println("회원탈퇴에 실패했습니다.");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>