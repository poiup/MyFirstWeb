package kr.co.ict;

public class UserVO {
	// VO는 특정 테이블의 자료를 자바형식으로 저장하기 위해 선언합니다.
	// 그래서 SQL데이터를 자바로 옮겨오기 위해서
	// 1. 담당할 테이블의 컬럼을 전부 변수로 만듭니다.
	private String uName;
	private String uId;
	private String uPw;
	private String uEmail;
	
	public UserVO(String uName, String uId, String uPw, String uEmail) {
		super();
		this.uName = uName;
		this.uId = uId;
		this.uPw = uPw;
		this.uEmail = uEmail;
	}
	
	// 2. getter, setter 생성자를 만들어주세요
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	// 3. (선택)toString으로 만들어주세요
	@Override
	public String toString() {
		return "userVO [uName=" + uName + ", uId=" + uId + ", uPw=" + uPw + ", uEmail=" + uEmail + "]";
	}
	
	
}
