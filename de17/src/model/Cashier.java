package model;

public class Cashier extends Employee {
	public Cashier() {
	}

	public Cashier(int id, String fullname, String username, String password, java.util.Date dateofbirth,
			String address, String email, String phonenumber, String position) {
		super(id, fullname, username, password, dateofbirth, address, email, phonenumber, position);
	}
}
