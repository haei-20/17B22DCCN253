package model;

public class Ticket {
    private static int count = 0;

	private int id;
	private double ticketprice;
	private String status;
	private Showtime showtime;
	private Seat seat;

	public Ticket() {
	}

	public Ticket(int id, double ticketprice, String status, Showtime showtime, Seat seat) {
		super();
		this.id = ++count;
		this.ticketprice = ticketprice;
		this.status = status;
		this.showtime = showtime;
		this.seat = seat;
	}

	public double getTicketPrice() {
		return ticketprice;
	}

	public void setTicketPrice(double ticketprice) {
		this.ticketprice = ticketprice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Showtime getShowtime() {
		return showtime;
	}

	public void setShowtime(Showtime showtime) {
		this.showtime = showtime;
	}

	public Seat getSeat() {
		return seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public int getId() {
		return id;
	}
	
	
}
