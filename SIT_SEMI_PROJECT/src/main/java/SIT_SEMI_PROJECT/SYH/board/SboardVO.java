package SIT_SEMI_PROJECT.SYH.board;

import java.sql.Timestamp;

public class SboardVO {
	int num;
	int userNum;
	String name;
	String title;
	String content;
	Timestamp regdate;
	Timestamp moddate;
	int count;
	int type;
	public SboardVO() { }

	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getUserNum() {
		return userNum;
	}
	
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public Timestamp getModdate() {
		return moddate;
	}
	
	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
}