<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm Phim</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #fef5e7; /* Màu nền be nhạt */
	margin: 0;
	padding: 20px;
}

.container {
	width: 90%;
	max-width: 800px; /* Giới hạn chiều rộng */
	margin: auto;
	background-color: #fef5e7;
	padding: 20px;
}

.header {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.back-button {
	font-size: 24px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	border: 2px solid black;
	padding: 5px 15px;
	margin-right: 20px;
	background-color: #f0f0f0;
}

h1 {
	text-align: center;
	flex-grow: 1; /* Đẩy tiêu đề vào giữa */
	margin: 0;
}

.search-form {
	margin-bottom: 25px;
	display: flex;
	align-items: center;
}

.search-form label {
	font-size: 1.1em;
	margin-right: 10px;
}

.search-form input[type="text"] {
	width: 300px;
	padding: 8px;
	font-size: 1em;
	border: 1px solid black;
}

.search-form input[type="submit"] {
	padding: 8px 12px;
	font-size: 1em;
	margin-left: 10px;
	background-color: #cddff8; /* Màu xanh nhạt của nút */
	border: 1px solid black;
	cursor: pointer;
}

.results-section h3 {
	font-size: 1.1em;
	margin-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid black;
}

th, td {
	border: 1px solid black;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #cddff8; /* Màu xanh nhạt của header bảng */
	font-weight: bold;
}

td {
	background-color: white; /* Nền trắng cho các ô dữ liệu */
}

td a {
	color: black;
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">

		<div class="header">
			<a href="gdHome.jsp" class="back-button">&lt;</a>
			<h1>Seach Movie</h1>
		</div>

		<div class="search-form">
			<form action="MovieSearchServlet" method="POST"
				style="display: flex; align-items: center;">
				<input type="hidden" name="action" value="searchMovie"> <label
					for="moviekeyword">Nhập tên phim</label> <input type="text"
					id="moviekeyword" name="moviekeyword" value="${param.moviekeyword}">
				<%-- Giữ lại từ khóa đã tìm kiếm --%>

				<input type="submit" value="Tìm kiếm">
			</form>
		</div>

		<div class="results-section">
			<h3>Kết quả tìm kiếm</h3>

			<table>
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên phim</th>
						<th>Thời lượng (phút)</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="movie" items="${listMovie}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${movie.title}</td>
							<%-- Vẫn giả định có thuộc tính 'title' --%>
							<td>${movie.duration}</td>
							<td><a
								href="MovieSearchServlet?action=viewMovieDetail&movieTitle=${movie.title}">
									Xem chi tiết </a></td>
						</tr>
					</c:forEach>

					<c:if test="${empty listMovie}">
						<tr>
							<td colspan="4" style="text-align: center;">Không tìm thấy
								phim nào.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

	</div>

</body>
</html>