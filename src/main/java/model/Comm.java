package model;

public class Comm extends Object {
	
	int postId;
	int postDisable;
	String userId;
	String commId;
	String content;
	String regDate;
	int boardType;
	
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
	public String getCommId() {
		return commId;
	}
	public void setCommId(String commId) {
		this.commId = commId;
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
	public void setRegdate(String regDate) {
		this.regDate = regDate;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	
	@Override
	public String toString() {
		return "Comm [postId=" + postId + ", postDisable=" + postDisable + ", userId=" + userId + ", commId=" + commId
				+ ", content=" + content + ", regDate=" + regDate + ", boardType=" + boardType + "]";
	}
	
}