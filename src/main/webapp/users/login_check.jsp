<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
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
	*/
	// 폼에서 보낸 아이디 비밀번호를 받아서 저장해주시고 콘솔에 확인해주세요
	request.setCharacterEncoding("UTF-8");
	// form데이터를 받아와 변수로 저장합니다.
	String fId = request.getParameter("fId");
	String fPw = request.getParameter("fPw");
	System.out.println(fId + fPw);
	
	UserDAO uDAO = UserDAO.getInstance();
	UserVO userData = uDAO.getUserData(fId);
	
	if(userData.getuId() != null){
		String uId = userData.getuId();
		String uPw = userData.getuPw();
		// uId에 일치하는 uPw를 받아와 fPw와 비교합니다
		if(fPw.equals(uPw)){
			// 로그인 성공후 세션발급
			session.setAttribute("login_pass", userData.getuName());
			session.setAttribute("login_uid",uId);
			// 세션발급후 환영페이지로 이동
			response.sendRedirect("welcome.jsp");
		} else {
			out.println("비밀번호를 확인해주세요<br/>");
			out.println("<button><a href ='login_form.jsp'>돌아가기</a></button>");
		}
	} else {
		out.println("로그인에 실패하셨습니다 계정정보를 확인해주세요<br/>");
		out.println("<button><a href ='login_form.jsp'>돌아가기</a></button>");
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