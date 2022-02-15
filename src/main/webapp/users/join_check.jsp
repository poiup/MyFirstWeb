<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String dbdriver = "com.mysql.cj.jdbc.Driver";
	String dburl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbid = "root";
	String dbpw = "mysql";

	request.setCharacterEncoding("UTF-8");
	// 폼에서 날려준 데이터 변수에 저장하기
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	String uemail = request.getParameter("uemail");
	out.println(uid+upw+uname+uemail);
	
	// 위의 사용자가 입력한 데이터를 토대로
	// 스크립트릿 내부에서 DB연동을 한 다음 INSERT 구문을 실행하도록 만들면 회원가입 절차 구현 가능
	try {
		// db 종류지정
		Class.forName(dbdriver);
		// db연결
		Connection con = DriverManager.getConnection(dburl,dbid,dbpw);
		
		// 쿼리문 작성 및 pstmt생성
		String joinQurey = "INSERT INTO userinfo VALUES (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(joinQurey);
		// ?칸 채우기
		pstmt.setString(1, uname);
		pstmt.setString(2, uid);
		pstmt.setString(3, upw);
		pstmt.setString(4, uemail);
		
		con.close();
		pstmt.close();
		// 실행
		int joinsql = pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();	
		
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