package SIT_SEMI_PROJECT.SYH.shopping;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class SshoppingVO {
	int num;
	int userNum;
	String name;
	String prodTitle;
	String prodContents;
	String fileName;
	Timestamp regdate;
	String prodType;
	int price;
	int prodRate;
	String prodState;
	MultipartFile uploadFile;
	public SshoppingVO() { }
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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

	public String getProdTitle() {
		return prodTitle;
	}

	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}

	public String getProdContents() {
		return prodContents;
	}

	public void setProdContents(String prodContents) {
		this.prodContents = prodContents;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getProdType() {
		return prodType;
	}

	public void setProdType(String prodType) {
		this.prodType = prodType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getProdRate() {
		return prodRate;
	}

	public void setProdRate(int prodRate) {
		this.prodRate = prodRate;
	}

	public String getProdState() {
		return prodState;
	}

	public void setProdState(String prodState) {
		this.prodState = prodState;
	}
	
	
}
