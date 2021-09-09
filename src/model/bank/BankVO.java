package model.bank;

public class BankVO {
	
	private int bnum;
	private String bname;
	private String name;
	private int balance;
	
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBnum() {
		return bnum;
	}
	public String getName() {
		return name;
	}
	public String getBname() {
		return bname;
	}
	
	
	
}
