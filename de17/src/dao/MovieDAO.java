package dao;

import java.sql.*;
import java.util.ArrayList;
import model.Movie;

public class MovieDAO extends DAO {
	public MovieDAO() {
		super();
	}

	public ArrayList<Movie> getMoviesbykeyword(String moviekeyword) {
		ArrayList<Movie> list = new ArrayList<>();
		String sql = "SELECT * FROM tblmovie WHERE movietitle LIKE ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + moviekeyword + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Movie m = new Movie();
				m.setMovietitle(rs.getString("movietitle"));
				m.setDuration(rs.getInt("duration"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Movie getMovieDetail(String title) {
		Movie m = null;
		String sql = "SELECT * FROM tblmovie WHERE movietitle = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				m = new Movie();
				m.setId(rs.getInt("id"));
				m.setMovietitle(rs.getString("movietitle"));
				m.setGenre(rs.getString("genre"));
				m.setDuration(rs.getInt("duration"));
				m.setCountryoforigin(rs.getString("countryoforigin"));
				m.setLanguage(rs.getString("language"));
				m.setFormat(rs.getString("format"));
				m.setAgeRestriction(rs.getString("ageRestriction"));
				m.setSynopsis(rs.getString("synopsis"));
				m.setDirector(rs.getString("director"));
				m.setCast(rs.getString("cast"));
				m.setPoster(rs.getString("poster"));
				m.setTrailer(rs.getString("trailer"));
				m.setReleasedate(rs.getDate("releasedate"));
				m.setEnddate(rs.getDate("enddate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
}
