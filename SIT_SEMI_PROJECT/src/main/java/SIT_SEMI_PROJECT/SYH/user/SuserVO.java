package SIT_SEMI_PROJECT.SYH.user;

import java.sql.Timestamp;

public class SuserVO {
	int num;
	String id;
	String pass;
	String name;
	int auth;
	Timestamp regdate;
	public SuserVO() { }
	
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegDate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
