package model;

public class Employee extends Member {
	private String position;

	public Employee() {
	}

	public Employee(int id, String fullname, String username, String password, java.util.Date dateofbirth,
			String address, String email, String phonenumber, String position) {
		super(id, fullname, username, password, dateofbirth, address, email, phonenumber);
		this.position = position;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
}
