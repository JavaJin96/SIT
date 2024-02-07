package SIT_SEMI_PROJECT.RYH.board;

import java.sql.Timestamp;

public class RboardVO {
    private int num;
    private int user_no;
    private String title;
    private String content;
    private int count;
    private String writer;
    private Timestamp contentDate;

    public RboardVO() { }

    public RboardVO(int user_no, String title, String content, int count, String writer) {
        super();
        this.setUser_no(user_no);
        this.title = title;
        this.content = content;
        this.count = count;
        this.writer = writer;
    }
    
    public RboardVO(int num, String title, String content, int count, String writer, Timestamp contentDate) {
        super();
        this.num = num;
        this.title = title;
        this.content = content;
        this.count = count;
        this.writer = writer;
        this.contentDate = contentDate;
    }

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
