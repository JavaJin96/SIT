package SIT_SEMI_PROJECT.SYH.board;

import java.sql.Timestamp;

public class ScommentsVO {
	int commentsNum;
	int userNum;
	int boardNum;
	String name;
	String comments;
	Timestamp regdate;
	
	public ScommentsVO() {  }
	
	public int getCommentsNum() {
		return commentsNum;
	}

	public void setCommentsNum(int commentsNum) {
		this.commentsNum = commentsNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {  // 사용자명 (닉네임)
		this.name = name;
	}

	public int getUserNum() {
		return userNum;
	}
	
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public int getBoardNum() {
		return boardNum;
	}
	
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}