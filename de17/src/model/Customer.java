package model;

import java.io.Serializable;
import java.util.Date;

// Customer kế thừa Member và implements Serializable để lưu session
public class Customer extends Member implements Serializable {
    private static final long serialVersionUID = 1L;

	public Customer() {
        super();
	}

	public Customer(int id, String fullname, String username, String password, Date dateofbirth, String address,
			String email, String phonenumber) {
		super(id, fullname, username, password, dateofbirth, address, email, phonenumber);
	}
}