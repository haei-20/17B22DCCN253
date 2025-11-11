package model;

import java.util.List;

public class Screeningroom {
	private int id;
	private String roomName;
	private int capacity;

	private List<Seat> seats;

	public Screeningroom() {
	}

	public Screeningroom(int id, String roomName, int capacity, List<Seat> seats) {
		super();
		this.id = id;
		this.roomName = roomName;
		this.capacity = capacity;
		this.seats = seats;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public List<Seat> getSeats() {
		return seats;
	}

	public void setSeats(List<Seat> seats) {
		this.seats = seats;
	}

	public int getId() {
		return id;
	}
	
}
