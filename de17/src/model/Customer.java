package model;

import java.util.Date;

public class Customer extends Member {

	public Customer() {
	}

	public Customer(int id, String fullname, String username, String password, Date dateofbirth, String address,
			String email, String phonenumber) {
		super(id, fullname, username, password, dateofbirth, address, email, phonenumber);
		// TODO Auto-generated constructor stub
	}

}
