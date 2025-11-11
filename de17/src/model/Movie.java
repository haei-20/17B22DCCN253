package model;

import java.sql.Date;

public class Movie {
	private int id;
    private String movietitle;
    private String genre;
    private int duration;
    private String countryoforigin;
    private String language;
    private String format;
    private String ageRestriction;
    private String synopsis;
    private String director;
    private String cast;
    private String poster;
    private String trailer;
    private Date releasedate;
    private Date enddate;
    
	public Movie() {
	}

	public Movie(int id, String movietitle, String genre, int duration, String countryoforigin, String language,
			String format, String agerestriction, String synopsis, String director, String cast, String poster,
			String trailer, Date releasedate, Date enddate) {
		super();
		this.id = id;
		this.movietitle = movietitle;
		this.genre = genre;
		this.duration = duration;
		this.countryoforigin = countryoforigin;
		this.language = language;
		this.format = format;
		this.ageRestriction = agerestriction;
		this.synopsis = synopsis;
		this.director = director;
		this.cast = cast;
		this.poster = poster;
		this.trailer = trailer;
		this.releasedate = releasedate;
		this.enddate = enddate;
	}

	public String getMovietitle() {
		return movietitle;
	}

	public void setMovietitle(String movietitle) {
		this.movietitle = movietitle;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getCountryoforigin() {
		return countryoforigin;
	}

	public void setCountryoforigin(String countryoforigin) {
		this.countryoforigin = countryoforigin;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getAgeRestriction() {
		return ageRestriction;
	}

	public void setAgeRestriction(String ageRestriction) {
		this.ageRestriction = ageRestriction;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public Date getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(Date releasedate) {
		this.releasedate = releasedate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
