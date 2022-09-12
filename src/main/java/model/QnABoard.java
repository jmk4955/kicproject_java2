package model;

public class QnABoard extends Object{
	int postId;
	int postDisable;
	String userId;
	String subject;
	String content;
	String regDate;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	@Override
	public String toString() {
		return "QnABoard [postId=" + postId + ", postDisable=" + postDisable + ", userId=" + userId + ", subject="
				+ subject + ", content=" + content + ", regDate=" + regDate + ", readCnt=" + readCnt + "]";
	}
	
}
