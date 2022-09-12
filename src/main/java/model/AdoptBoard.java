package model;

public class AdoptBoard extends Object {
	int postId;
	int postDisable;
	int postReportCnt;
	String userId;
	String tel;
	String content;
	String place;
	String regDate;
	String petDetail;
	String petName;
	int petGender;
	String petType;
	String petImg;
	int vaccin;
	int neuter;
	int readCnt;
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getPostDisable() {
		return postDisable;
	}
	public void setPostDisable(int postDisable) {
		this.postDisable = postDisable;
	}
	public int getPostReportCnt() {
		return postReportCnt;
	}
	public void setPostReportCnt(int postReportCnt) {
		this.postReportCnt = postReportCnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPetDetail() {
		return petDetail;
	}
	public void setPetDetail(String petDetail) {
		this.petDetail = petDetail;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public int getPetGender() {
		return petGender;
	}
	public void setPetGender(int petGender) {
		this.petGender = petGender;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public String getPetImg() {
		return petImg;
	}
	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}
	public int getVaccin() {
		return vaccin;
	}
	public void setVaccin(int vaccin) {
		this.vaccin = vaccin;
	}
	public int getNeuter() {
		return neuter;
	}
	public void setNeuter(int neuter) {
		this.neuter = neuter;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	@Override
	public String toString() {
		return "AdoptBoard [postId=" + postId + ", postDisable=" + postDisable + ", postReportCnt=" + postReportCnt
				+ ", userId=" + userId + ", tel=" + tel + ", content=" + content + ", place=" + place + ", regDate="
				+ regDate + ", petDetail=" + petDetail + ", petName=" + petName + ", petGender=" + petGender
				+ ", petType=" + petType + ", petImg=" + petImg + ", vaccin=" + vaccin + ", neuter=" + neuter
				+ ", readCnt=" + readCnt + "]";
	}
	
}
