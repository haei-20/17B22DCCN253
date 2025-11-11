package model;

public class Seat {
	private int id;
	private String seatname;
	private String rowname;
	private String columnn;

	public Seat() {
	}

	public Seat(int id, String seatname, String rowname, String columnn) {
		super();
		this.id = id;
		this.seatname = seatname;
		this.rowname = rowname;
		this.columnn = columnn;
	}

	public String getSeatname() {
		return seatname;
	}

	public void setSeatname(String seatname) {
		this.seatname = seatname;
	}

	public String getRowname() {
		return rowname;
	}

	public void setRowname(String rowname) {
		this.rowname = rowname;
	}

	public String getColumnn() {
		return columnn;
	}

	public void setColumnn(String columnn) {
		this.columnn = columnn;
	}

	public int getId() {
		return id;
	}

}
