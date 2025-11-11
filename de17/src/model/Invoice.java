package model;

import java.util.Date;
import java.util.List;

public class Invoice {
	private int id;
	private Date issuedate;
	private double amount; // tổng tiền
	private double transactionAmount; // tiền giao dịch (có thể khác tổng nếu
										// giảm giá...)
	private String paymentMethod;

	private Customer customer; // 1 Invoice thuộc về 1 Customer
	private Cashier cashier; // 1 Invoice do 1 Cashier lập
	private List<Ticket> tickets; // 1 Invoice có nhiều Ticket

	public Invoice() {
	}

	public Invoice(int id, Date issuedate, double amount, double transactionAmount, String paymentMethod,
			Customer customer, Cashier cashier, List<Ticket> tickets) {
		this.id = id;
		this.issuedate = issuedate;
		this.amount = amount;
		this.transactionAmount = transactionAmount;
		this.paymentMethod = paymentMethod;
		this.customer = customer;
		this.cashier = cashier;
		this.tickets = tickets;
	}

	// getters và setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getIssuedate() {
		return issuedate;
	}

	public void setIssuedate(Date issuedate) {
		this.issuedate = issuedate;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(double transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Cashier getCashier() {
		return cashier;
	}

	public void setCashier(Cashier cashier) {
		this.cashier = cashier;
	}

	public List<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}
}
