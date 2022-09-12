package model;

public class Member {
	
	String userId;
	String pwd;
	String tel;
	String email;
	String address;
	String petName;
	int userType;
	int userReortCnt;
	String regDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getUserReortCnt() {
		return userReortCnt;
	}
	public void setUserReortCnt(int userReortCnt) {
		this.userReortCnt = userReortCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", pwd=" + pwd + ", tel=" + tel + ", email=" + email + ", address="
				+ address + ", petName=" + petName + ", userType=" + userType + ", userReortCnt=" + userReortCnt
				+ ", regDate=" + regDate + "]";
	}
	
}
