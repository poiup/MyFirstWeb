<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	//DB변수
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	try{
		// DB연결
		Class.forName(dbDriver);
		Connection con =  DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 쿼리문
		String updateQuery = "UPDATE userinfo SET uname = ?, uemail = ?, upw = ? WHERE uId = ?";
		PreparedStatement pstmt = con.prepareStatement(updateQuery);
		pstmt.setString(1, newName);
		pstmt.setString(2, newEmail);
		pstmt.setString(3, newPw);
		pstmt.setString(4, uId);
		// 수정 쿼리 전송
		int update = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		// 수정 완료후 원래패이지로 돌아가기
		response.sendRedirect("login_update.jsp");
	} catch(Exception e){
		e.printStackTrace();
		out.println("오류");
	}
*/
	request.setCharacterEncoding("UTF-8");
	// 수정할 값들
	String uId = (String)session.getAttribute("login_uid");		
	String newPw = request.getParameter("newPw");
	String newName = request.getParameter("newName");
	String newEmail = request.getParameter("newEmail");
	UserDAO uDAO = UserDAO.getInstance();
	uDAO.userSetUpdateDAO(newName, newEmail, newPw, uId);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= uId %>님의 회원정보가 수정되었습니다.</h1>
	<a href = "login_update.jsp">웰컴페이지로 돌아가기</a>
</body>
</html>