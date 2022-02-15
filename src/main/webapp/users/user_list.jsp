<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB변수
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	// 트라이 구문 밖인 본문에서도 사용할수 있도록 try구문 밖에서 선언해줍니다.
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName(dbDriver);
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		String dataListQuery = "SELECT * FROM userinfo";
		pstmt = con.prepareStatement(dataListQuery);
		rs = pstmt.executeQuery();
		
		/*
		while(rs.next()){
			out.println("----------------------------------<br/>");
			out.print("회원 이름 :" + rs.getString(1)  + "<br/>");
			out.print("회원 아이디 :" + rs.getString(2)  + "<br/>");
			out.print("회원 비밀번호 :" + rs.getString(3)  + "<br/>");
			out.println("회원 이메일 :" + rs.getString(4) + "<br/>");
			out.println("<br>-------------------------------<br>");
		}
		*/
	}catch(Exception e){
		out.print("목록을 불러오는데 실패하였습니다.");
		e.printStackTrace();
	} finally {
		// finally는 try와 지역이 다르기때문에
		// try밖에 변수를 선언해줘야 finally에서 사용할수 있습니다.
		
		// 문제는 현재 이 구문이 rs.next()가 rs.close()를 한 이후에 배치되어있어서 에러가 나옵니다.
		con.close();
		pstmt.close();
		rs.close();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {border}
</style>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>uname</th>
				<th>uid</th>
				<th>upw</th>
				<th>uemail</th>
			</tr>
		</thead>
		<tbody>
			<%while(rs.next()){%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
				</tr>
				
				
			<%}%>
		</tbody>
	</table>
</body>
</html>