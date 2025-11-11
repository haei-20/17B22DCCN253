package model;

import java.sql.Time;
import java.util.Date;

public class Showtime {
    private static int count = 0; 
	private int id;
	private Date date;
	private java.sql.Time startTime;
	private java.sql.Time endTime;

	private Movie movie;
	private Screeningroom screeningroom;

	public Showtime() {
	}

	public Showtime(int id, Date date, Time startTime, Time endTime, Movie movie, Screeningroom screeningroom) {
		super();
		this.id = ++count;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.movie = movie;
		this.screeningroom = screeningroom;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public java.sql.Time getStartTime() {
		return startTime;
	}

	public void setStartTime(java.sql.Time startTime) {
		this.startTime = startTime;
	}

	public java.sql.Time getEndTime() {
		return endTime;
	}

	public void setEndTime(java.sql.Time endTime) {
		this.endTime = endTime;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Screeningroom getScreeningroom() {
		return screeningroom;
	}

	public void setScreeningroom(Screeningroom screeningroom) {
		this.screeningroom = screeningroom;
	}

	public int getId() {
		return id;
	}

}
