package kr.co.ict;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	//DB변수
	//private String dbDriver = "com.mysql.cj.jdbc.Driver";
	//private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	//private String dbId = "root";
	//private String dbPw = "mysql";
	private DataSource ds = null;;
	
	// 생성할 떄 자동으로 Class.forName()을 실행하게 만듭니다.
	// 어떤 구문을 실행하더라도 공통으로 실행해줘하하는 부분
	/*
	public UserDAO() {
		try {
			Class.forName(dbDriver);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	*/

	// 싱글턴 패턴 처리
	// 3. 맴버변수로 UserDAO를 하나 생성해줍니다.
	private static UserDAO dao = new UserDAO();
	// 싱글턴은 요청시마다 DAO를 매번 새로 생성하지않고, 먼저 하나를 생성해둔 다음
	// 사용자 요청떄는 이미 생성된 DAO의 주소값만 공유해서
	// DAO생성에 필요한 시간을 절약하기위해 사용합니다.
	private UserDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 2. static 키워드를 이용해서 단 한번만 생성하고, 그 이후로는
	// 주소를 공유하는 getInstance() 메서드를 생성합니다.
	public static UserDAO getInstance() {
		if(dao == null) {
			dao = new UserDAO();
		}
		return dao;
	}
	
	
	// user_list2.jsp의 코드로직을 대체해보겠습니다.
	// user_list.jsp에서 전체 유저 목록을 필요로 하기 때문에
	// 실행 결과로 List<UserVO>를 리턴해줘야 합니다.
	// 역시 SELECT구문을 실행할때에는 리턴 자료가 필요하고
	// INSER,DELETE, UPDATE구문을 실행할떄는 리턴 자료가 void입니다.
	public List<UserVO> getAllUserList() throws SQLException{
		// Connection,PreparedStatement,ResultSet,List<UserVO> 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UserVO> userList = new ArrayList<>();
		try { 
			// db연결
			con = ds.getConnection();
			//쿼리 작성
			String sql = "SELECT * FROM userinfo";
			pstmt = con.prepareStatement(sql);
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
				
				// UserVO객체에 userData 안에 유저 정보 넣기
				UserVO userData = new UserVO(uName, uId, uPw, uEmail);
				// userData를 배열userList에 추가
				userList.add(userData);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			con.close();
			pstmt.close();
			rs.close();
		}
		return userList;
	}

	// updateDAO
	// login_update.jsp의 경우 로그인한 유저 한명의 데이터만 DB를 얻어옵니다.
	// 따라서, 그 한명의 유저 데이터만 이용해 SELECT구문을 써야합니다.
	// login_updadte.jsp상단의 변수에 들어있는 유저명을 이용해 유저데이터를 얻어옵니다.
	public UserVO getUserData(String getId) throws SQLException{
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문에서만 차이납니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO userData = new UserVO(null,null,null,null);
		try {
			// 연결
			con = ds.getConnection();
			// 쿼리문
			String sql = "SELECT * FROM userinfo WHERE uid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, getId);
			
			// 실행
			rs = pstmt.executeQuery();
			// 유저 정보 받아오기
			
			if(rs.next()) {
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
				userData = new UserVO(uName, uId, uPw, uEmail);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			pstmt.close();
			rs.close();
		}
		return userData; // DB에서 UserVO에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴하세요.
	}

	
	// 값을 수정하기만 하면 되고 페이지에 값을 돌려줄 필요가 없읍니다.
	public void userSetUpdateDAO(String newName, String newEmail, String newPw, String uId ) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 연결
			con = ds.getConnection();
			// 쿼리문
			String sql = "UPDATE userinfo SET uname = ?, uemail = ?, upw = ? WHERE uId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newName);
			pstmt.setString(2, newEmail);
			pstmt.setString(3, newPw);
			pstmt.setString(4, uId);
			
			// 실행
			int update = pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			con.close();
			pstmt.close();
		}
		return;
	}


	public void insertUserDAO(String uName, String uId,String uPw ,String uEmail) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {	
			// db연결
			con = ds.getConnection();
			
			// 쿼리문 작성 및 pstmt생성
			String joinQurey = "INSERT INTO userinfo VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(joinQurey);
			// ?칸 채우기
			pstmt.setString(1, uName);
			pstmt.setString(2, uId);
			pstmt.setString(3, uPw);
			pstmt.setString(4, uEmail);
			
			// 실행
			int joinsql = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
			pstmt.close();
		}
	}
	
	

}
