<%@page import="java.util.List"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
//DB변수
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// ArrayList<userVO> 자료형을 이용해 한줄 한줄 단위로 여러 row를 저장합니다.
	// VO와 DTO는 데이터베이스에 있는 데이터를 가져와 저장하는 용도입니다
	List<UserVO> userList = new ArrayList<>();
	System.out.println(userList);
	try {
		// 연결
		Class.forName(dbDriver);
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 쿼리실행
		String dataListQuery = "SELECT * FROM userinfo";
		pstmt = con.prepareStatement(dataListQuery);
		rs = pstmt.executeQuery();
		
		// 테이블에 저정된 데이터를 자바로 옮기기 위해서 userVO를 선언했습니다.
		while(rs.next()){
			// 1. ResultSet 데이터 가져오기
			String uName = rs.getString("uname");
			String uId = rs.getString("uid");
			String uPw = rs.getString("upw");
			String uEmail = rs.getString("uemail");
			
			UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			userList.add(userData);
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		con.close();
		pstmt.close();
		rs.close();
	}
	// 아까 발생했던 rs.close()실행 문제로 인해
	// DB에 있는 자료를 꺼냇을때, 곧바로 java데이터로 받아오는 작접을 수행한 다음
	// rs.close()를 하면 문제가 없습니다.
	// 따라서 SELECT 구문의 결과(SQL데이터)를 담을 클래스가 필요합니다.
	// 이를 VO(value Object)라고 부릅니다.
	// VO는 클래스이기 때문에 src/main/java에 클래스를 선언 및 정의합니다.
	// userVO.class를 만들어보겠습니다.
*/
%>

<%
	// 모든 접속정보는 UserDAO 클래스 내에 있습니다.
	// 따라서 UserDAO를 생성하는 것으로 접속정보 설정이 끝납니다.
	UserDAO uDAO = UserDAO.getInstance();
	//  dao내부에 userinfo테이블 전체의 데이터를 가져오는
	// getAllUserList()를 호출하는것으로 필요데이터 적재가 끝납니다.
	List<UserVO> userList = uDAO.getAllUserList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  향상된 for문을 이용해서 userList내부의 데이터를
	 테이블형태로 user_list와 동일한 양식으로 화면에 출력해주세요. -->
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
			<%
			for(UserVO user : userList){
			%>
				<tr>
					<td><%= user.getuName() %></td>
					<td><%= user.getuId() %></td>
					<td><%= user.getuPw() %></td>
					<td><%= user.getuEmail() %></td>
				</tr>					
		<%}%>
		</tbody>
	</table>
</body>
</html>