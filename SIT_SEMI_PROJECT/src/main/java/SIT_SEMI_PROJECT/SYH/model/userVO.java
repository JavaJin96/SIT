package SIT_SEMI_PROJECT.SYH.model;

import java.sql.Timestamp;

public class userVO {
	private int num;
	private String id;
	private String pass;
	private String name;
	private int auth;
	private Timestamp regDate;
	public userVO() { }

	public userVO(String id, String pass, String name, int auth, Timestamp regDate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.regDate = regDate;
	}
	
	public userVO(int num, String id, String pass, String name, int auth, Timestamp regDate) {
		super();
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.auth = auth;
		this.regDate = regDate;
	}
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAuth() {
		return auth;
	}
	
	public void setAuth(int auth) {
		this.auth = auth;
	}
	
	public Timestamp getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "userVO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", auth=" + auth
				+ ", regDate=" + regDate + "]";
	}
}
