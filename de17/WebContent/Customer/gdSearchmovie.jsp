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
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f6f9; /* Nền xám nhạt hiện đại */
	margin: 0;
	padding: 40px 20px;
}

.container {
	width: 90%;
	max-width: 900px;
	margin: auto;
	background-color: #ffffff; /* Nền trắng */
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Shadow mềm */
}

.header {
	display: flex;
	align-items: center;
	margin-bottom: 30px;
	border-bottom: 2px solid #eeeeee;
	padding-bottom: 15px;
}

.back-button {
	font-size: 20px;
	font-weight: 700;
	text-decoration: none;
	color: #495057;
	border: none;
	padding: 8px 15px;
	margin-right: 20px;
	background-color: #e9ecef; /* Nút back mềm mại */
	border-radius: 6px;
	transition: background-color 0.2s;
}

.back-button:hover {
	background-color: #dee2e6;
}

h1 {
	text-align: center;
	flex-grow: 1;
	margin: 0;
	color: #343a40;
	font-size: 1.8em;
}

.search-form {
	margin-bottom: 30px;
	display: flex;
	align-items: center;
	padding: 15px;
	background-color: #f8f9fa; /* Nền form nổi bật */
	border-radius: 8px;
	border: 1px solid #ced4da;
}

.search-form label {
	font-size: 1em;
	font-weight: 600;
	margin-right: 15px;
	color: #495057;
}

.search-form input[type="text"] {
	flex-grow: 1;
	padding: 10px 12px;
	font-size: 1em;
	border: 1px solid #adb5bd;
	border-radius: 6px;
	transition: border-color 0.2s;
}

.search-form input[type="text"]:focus {
	border-color: #007bff;
	outline: none;
	box-shadow: 0 0 0 0.1rem rgba(0, 123, 255, 0.25);
}

.search-form input[type="submit"] {
	padding: 10px 20px;
	font-size: 1em;
	margin-left: 15px;
	background-color: #007bff; /* Màu chủ đạo */
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.2s, box-shadow 0.2s;
}

.search-form input[type="submit"]:hover {
	background-color: #0056b3;
}

.results-section h3 {
	font-size: 1.2em;
	margin-bottom: 15px;
	color: #343a40;
	border-left: 4px solid #007bff;
	padding-left: 10px;
}

/* Định dạng Bảng */
table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #dee2e6;
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	border: 1px solid #dee2e6;
	padding: 12px;
	text-align: left; /* Mặc định căn trái cho tất cả các cột */
	font-size: 0.95em;
}

th {
	background-color: #e9ecef;
	font-weight: 600;
	color: #495057;
}

tbody tr:nth-child(even) {
	background-color: #f8f9fa;
}

td {
	background-color: white;
}

td a {
	color: #007bff;
	text-decoration: none;
	font-weight: 500;
}

td a:hover {
	text-decoration: underline;
}

/* Thông báo không tìm thấy */
.results-section p {
	text-align: center;
	padding: 20px;
	color: #6c757d;
}
.right {
    text-align: right !important;
}

</style>
</head>
<body>

	<div class="container">

		<div class="header">
			<a href="${pageContext.request.contextPath}/Customer/gdHome.jsp"
				class="back-button">&lt;</a>
			<h1>Seach Movie</h1>
		</div>

		<div class="search-form">
			<form action="${pageContext.request.contextPath}/MovieSearchServlet"
				method="POST" style="display: flex; align-items: center;">

				<input type="hidden" name="action" value="SEARCHMOVIE"> <label
					for="moviekeyword">Nhập tên phim</label> <input type="text"
					id="moviekeyword" name="moviekeyword" value="${param.moviekeyword}">
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
							<td class="right">${status.count}</td>
							<td>${movie.movietitle}</td>
							<td class="right">${movie.duration}</td>
							<td><a
								href="${pageContext.request.contextPath}/MovieSearchServlet?action=VIEWAIL&movieTitle=${movie.movietitle}">
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