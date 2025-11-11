package model;

import java.util.Date;

public class Member {
	private int id;
	private String fullname;
	private String username;
	private String password;
	private Date dateofbirth;
	private String address;
	private String email;
	private String phonenumber;

	public Member() {
	}

	public Member(int id, String fullname, String username, String password, Date dateofbirth, String address,
			String email, String phonenumber) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.dateofbirth = dateofbirth;
		this.address = address;
		this.email = email;
		this.phonenumber = phonenumber;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public int getId() {
		return id;
	}

}
