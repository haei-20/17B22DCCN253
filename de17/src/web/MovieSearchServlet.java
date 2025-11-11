package web;

import dao.MovieDAO;
import model.Movie;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/MovieSearchServlet")
public class MovieSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	private MovieDAO movieDAO;

	public void init() {
		movieDAO = new MovieDAO();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
        
		String command = (action == null || action.isEmpty()) ? "SEARCH_FORM" : action.toUpperCase(); 

		String url = null;

		switch (command) {
		case "SEARCH_FORM": 
			// Mặc định: Hiển thị form và danh sách rỗng/tất cả
			searchMovie(req, resp, "");
 
			url = "/Customer/gdSearchmovie.jsp"; 
			break;

		case "SEARCHMOVIE": 
			String keyword = req.getParameter("moviekeyword");
			searchMovie(req, resp, keyword);
       
			url = "/Customer/gdSearchmovie.jsp"; 
			break;

		case "VIEWAIL": 
			viewMovieDetail(req, resp);
           
			url = "/Customer/gdMovieDetail.jsp"; 
			break;

		default:
			// Chuyển hướng về trang chủ nếu action không hợp lệ
			resp.sendRedirect(req.getContextPath() + "/Customer/gdHome.jsp");
			return;
		}

		// Controller chuyển tiếp đến View
		if (url != null) {
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
		}
	}

	private void searchMovie(HttpServletRequest req, HttpServletResponse resp, String keyword)
			throws ServletException, IOException {

		// Gọi DAO 
		ArrayList<Movie> listMovie = movieDAO.getMoviesbykeyword(keyword == null ? "" : keyword);

		// Đặt Model vào Request Scope
		req.setAttribute("listMovie", listMovie);
	}

	private void viewMovieDetail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String title = req.getParameter("movieTitle");

		// Gọi DAO với TÊN PHƯƠNG THỨC 
		Movie movie = movieDAO.getMovieDetail(title);

		// Đặt Model vào Request Scope
		req.setAttribute("movieDetail", movie);
	}
}