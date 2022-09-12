package model;

public class Report extends Object {
	
	int postId;
	int reportId;
	String userId;
	String repoUserId;
	String reportText;
	String regDate;
	int boardType;
	int reportType;
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRepoUserId() {
		return repoUserId;
	}
	public void setRepoUserId(String repoUserId) {
		this.repoUserId = repoUserId;
	}
	public String getReportText() {
		return reportText;
	}
	public void setReportText(String reportText) {
		this.reportText = reportText;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public int getReportType() {
		return reportType;
	}
	public void setReportType(int reportType) {
		this.reportType = reportType;
	}
	
	@Override
	public String toString() {
		return "Report [postId=" + postId + ", reportId=" + reportId + ", userId=" + userId + ", repoUserId="
				+ repoUserId + ", reportText=" + reportText + ", regDate=" + regDate + ", boardType=" + boardType
				+ ", reportType=" + reportType + "]";
	}
	
}
