<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết Phim</title>
<style>

/* Tinh chỉnh CSS cho giao diện chi tiết phim */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 40px 20px;
}

.container {
	width: 90%;
	max-width: 1000px;
	margin: auto;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
	background-color: #e9ecef;
	border-radius: 6px;
	transition: background-color 0.2s;
}

.back-button:hover {
	background-color: #dee2e6;
}

.title {
	flex-grow: 1;
	text-align: center;
	font-size: 1.8em;
	font-weight: 600;
	color: #343a40;
	padding: 10px 0; /* Loại bỏ border và căn lề thủ công */
	margin: 0;
}

/* Bố cục 2 cột chính */
.content-wrapper {
	display: flex;
	gap: 30px; /* Khoảng cách giữa 2 cột */
	margin-top: 20px;
}

.left-column {
	flex: 0 0 300px; /* Giữ poster cố định 300px */
	padding: 0;
}

.left-column img {
	width: 100%;
	height: auto;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15); /* Shadow cho poster */
}

.right-column {
	flex: 1;
}

/* Bảng chi tiết */
.details-table {
	width: 100%;
	border-collapse: collapse;
}

.details-table tr {
	vertical-align: top;
	border-bottom: 1px dotted #dee2e6; /* Đường ngăn cách mềm */
}

.details-table th {
	text-align: right;
	font-weight: 600;
	padding: 10px 15px 10px 0;
	white-space: nowrap;
	width: 150px; /* Chiều rộng cố định cho nhãn */
	color: #495057;
}

.details-table td {
	text-align: left;
	padding: 10px 0 10px 15px;
}

.details-table strong {
	font-size: 1.2em;
	color: #007bff;
}

/* Phần Trailer */
.trailer-section {
	margin-top: 20px;
	padding-top: 15px;
	border-top: 2px solid #eeeeee;
}

.trailer-section a {
	display: inline-flex;
	align-items: center;
	text-decoration: none;
	color: #dc3545; /* Màu đỏ cho Trailer */
	font-weight: 600;
	padding: 5px 0;
	transition: color 0.2s;
}

.trailer-section a:hover {
	color: #c82333;
	text-decoration: underline;
}

.trailer-section p {
	margin-left: 5px;
	margin: 0;
}
</style>
</head>
<body>

	<div class="container">

		<div class="header">
			<a
				href="${pageContext.request.contextPath}/MovieSearchServlet?action=SEARCH_FORM"
				class="back-button">&lt;</a>

			<div class="title">View Movie Detail</div>
		</div>

		<c:if test="${not empty movieDetail}">
			<div class="content-wrapper">

				<div class="left-column">
					<img
						src="${pageContext.request.contextPath}/images/${movieDetail.poster}"
						alt="Poster phim ${movieDetail.movietitle}">
				</div>

				<div class="right-column">
					<table class="details-table">
						<tr>
							<th>Tên phim:</th>
							<td><strong>${movieDetail.movietitle}</strong></td>
						</tr>
						<tr>
							<th>Mô tả:</th>
							<td>${movieDetail.synopsis}</td>
						</tr>
						<tr>
							<th>Đạo diễn:</th>
							<td>${movieDetail.director}</td>
						</tr>
						<tr>
							<th>Diễn viên:</th>
							<td>${movieDetail.cast}</td>
						</tr>
						<tr>
							<th>Thể loại:</th>
							<td>${movieDetail.genre}</td>
						</tr>
						<tr>
							<th>Thời lượng:</th>
							<td>${movieDetail.duration}phút</td>
						</tr>
						<tr>
							<th>Ngày khởi chiếu:</th>
							<td>${movieDetail.releasedate}</td>
						</tr>
						<tr>
							<th>Quốc gia:</th>
							<td>${movieDetail.countryoforigin}</td>
						</tr>
						<tr>
							<th>Ngôn ngữ:</th>
							<td>${movieDetail.language}</td>
						</tr>
						<tr>
							<th>Định dạng:</th>
							<td>${movieDetail.format}</td>
						</tr>
						<tr>
							<th>Giới hạn độ tuổi:</th>
							<td>${movieDetail.ageRestriction}</td>
						</tr>
					</table>

					<div class="trailer-section">
						<table class="details-table">
							<tr>
								<th>Trailer:</th>
								<td>
                                    <c:if test="${not empty movieDetail.trailer}">
                                        <a href="${movieDetail.trailer}" target="_blank"
											style="text-decoration: none; color: black; font-weight: bold;">
											
											<span style="display: block; margin-left: 5px;">(Nhấn để xem Trailer trên YouTube)</span>
										</a>
									</c:if> 
                                    
                                    <c:if test="${empty movieDetail.trailer}">
                                        <span>Không có Trailer</span>
									</c:if>
                                </td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${empty movieDetail}">
			<p style="text-align: center;">Không thể tải thông tin chi tiết
				của phim.</p>
		</c:if>

	</div>

</body>
</html>