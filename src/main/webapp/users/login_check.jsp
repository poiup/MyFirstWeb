<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼에서 보낸 아이디 비밀번호를 받아서 저장해주시고 콘솔에 확인해주세요
	request.setCharacterEncoding("UTF-8");
	String fId = request.getParameter("fId");
	String fPw = request.getParameter("fPw");
	System.out.println(fId + fPw);
	
	
	// DB변수
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	// DB연결을 변수를 이용해서 해주세요.
	try {
		// db종류 선택 및 연결
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		try {
			
			String loginCheckQuery = "SELECT * FROM userinfo WHERE uid = ?";
			PreparedStatement pstmt = con.prepareStatement(loginCheckQuery);
			pstmt.setString(1, fId);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if(fId.equals(rs.getString(2))){
				if(fPw.equals(rs.getString(3))){
					session.setAttribute("login_pass", rs.getString(1));
					session.setAttribute("login_uid", rs.getString(2));
					rs.close();
					pstmt.close();
					con.close();
					response.sendRedirect("welcome.jsp");
				} else {
					out.println("비밀번호를 확인해주세요");
				}
			}
		} catch(Exception e){
			e.printStackTrace();
			out.println("로그인에 실패하셨습니다 계정정보를 확인해주세요");
		}
		
		// 사용자 입력 id를 기준으로 들어온 데이터가 있다면
		// DB에 적재되어있던 비밀번호를 마저 비교해 둘다 일치하면 세션발급
		// 그렇지 않다면 로그인 실패 메세지가 나오도록 처리
		
		
		// 만약 웰컴페이지도 만들 여력이 되신다면
		// 이후 리다이렉트해서 웰컴 페이지에 세션정보를 보내서 환영페이지를 작성해주세요
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