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

	// Đổi tên biến để khớp với sơ đồ UML: movieDAO.getMoviesbykeyword(String)
	// Giả định phương thức này trả về ArrayList<Movie>
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
		// Thiết lập mã hóa ký tự để xử lý tiếng Việt
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		// Lấy action từ tham số, sử dụng 'showListMovieForm' làm mặc định
		String action = req.getParameter("action");
		if (action == null)
			action = "showListMovieForm"; // Mặc định hiển thị form tìm kiếm
											// trống

		switch (action) {
		case "searchMovie":
			searchMovie(req, resp);
			break;
		case "viewMovieDetail":
			viewMovieDetail(req, resp);
			break;
		case "showListMovieForm":
		default:
			showListMovieForm(req, resp);
			break;
		}
	}

	/**
	 * Chuyển hướng đến trang tìm kiếm (gdSearchmovie.jsp) với danh sách rỗng
	 * hoặc nếu không có từ khóa nào được tìm kiếm trước đó.
	 */
	private void showListMovieForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Khởi tạo danh sách rỗng để tránh lỗi null pointer trong JSP
		req.setAttribute("listMovie", new ArrayList<Movie>());
		RequestDispatcher rd = req.getRequestDispatcher("/gdSearchmovie.jsp");
		rd.forward(req, resp);
	}

	/**
	 * Xử lý tìm kiếm phim theo từ khóa. Phương thức này được gọi khi form tìm
	 * kiếm POST đến Servlet.
	 */
	private void searchMovie(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy từ khóa (đổi tên tham số từ 'moviekeyword' để khớp với JSP)
		String keyword = req.getParameter("moviekeyword");

		// Gọi DAO để lấy danh sách phim
		// Giả định movieDAO.getMoviesByKeyword chấp nhận null/rỗng
		ArrayList<Movie> listMovie = movieDAO.getMoviesbykeyword(keyword == null ? "" : keyword);

		// ĐẶT TÊN ATTRIBUTE PHẢI KHỚP VỚI JSP: listMovie
		req.setAttribute("listMovie", listMovie);

		// Forward về trang tìm kiếm để hiển thị kết quả
		RequestDispatcher rd = req.getRequestDispatcher("/gdSearchmovie.jsp");
		rd.forward(req, resp);
	}

	/**
	 * Lấy chi tiết một phim cụ thể.
	 */
	private void viewMovieDetail(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Lấy tên phim (đổi tên tham số từ 'movieTitle' để khớp với JSP)
		String title = req.getParameter("movieTitle");

		// Gọi DAO để lấy chi tiết phim
		Movie movie = movieDAO.getMovieDetail(title);

		// ĐẶT TÊN ATTRIBUTE PHẢI KHỚP VỚI JSP: movieDetail
		req.setAttribute("movieDetail", movie);

		// Forward về trang chi tiết phim
		RequestDispatcher rd = req.getRequestDispatcher("/gdMovieDetail.jsp");
		rd.forward(req, resp);
	}
}