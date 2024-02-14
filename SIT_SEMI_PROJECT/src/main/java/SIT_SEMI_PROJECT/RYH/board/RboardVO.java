package SIT_SEMI_PROJECT.RYH.board;

import java.sql.Timestamp;

public class RboardVO {
    int num;
    int user_no;
    String title;
    String contents;
    int count;
    String writer;
    Timestamp contentDate;

    public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String content) {
		this.contents = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getContentDate() {
		return contentDate;
	}

	public void setContentDate(Timestamp contentDate) {
		this.contentDate = contentDate;
	}

    
}
