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

	private MovieDAO movieDAO;

	// Hằng số cho các Action
	private static final String ACTION_SEARCH_FORM = "SEARCH_FORM";
	private static final String ACTION_SEARCH = "SEARCHMOVIE";
	private static final String ACTION_VIEW_DETAIL = "VIEWAIL";

	// Hằng số cho các View
	private static final String VIEW_SEARCH_PAGE = "/Customer/gdSearchmovie.jsp";
	private static final String VIEW_DETAIL_PAGE = "/Customer/gdMovieDetail.jsp";

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
		String command = (action == null || action.isEmpty()) ? ACTION_SEARCH_FORM : action.toUpperCase();

		String url = null;

		switch (command) {
		case ACTION_SEARCH_FORM:
			// Mặc định: Hiển thị form và danh sách rỗng/tất cả
			showMoviesAndSetView(req, resp, "");
			url = VIEW_SEARCH_PAGE;
			break;

		case ACTION_SEARCH:
			String keyword = req.getParameter("moviekeyword");
			showMoviesAndSetView(req, resp, keyword);
			url = VIEW_SEARCH_PAGE;
			break;

		case ACTION_VIEW_DETAIL:
			viewMovieDetail(req, resp);
			url = VIEW_DETAIL_PAGE;
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

	private void showMoviesAndSetView(HttpServletRequest req, HttpServletResponse resp, String keyword)
			throws ServletException, IOException {

		// Gọi DAO với TÊN PHƯƠNG THỨC GỐC của bạn
		ArrayList<Movie> listMovie = movieDAO.getMoviesbykeyword(keyword == null ? "" : keyword);

		// Đặt Model vào Request Scope
		req.setAttribute("listMovie", listMovie);
	}

	private void viewMovieDetail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String title = req.getParameter("movieTitle");

		// Gọi DAO với TÊN PHƯƠNG THỨC GỐC của bạn
		Movie movie = movieDAO.getMovieDetail(title);

		// Đặt Model vào Request Scope
		req.setAttribute("movieDetail", movie);
	}
}