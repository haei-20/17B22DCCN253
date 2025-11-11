<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="model.Movie"%>
<html>
<head>
<title>Chi tiết phim</title>
</head>
<body>
	<%
		Movie m = (Movie) request.getAttribute("movie");
		if (m != null) {
	%>
	<h2><%=m.getTitle()%></h2>
	<p>
		<b>Thể loại:</b>
		<%=m.getGenre()%></p>
	<p>
		<b>Thời lượng:</b>
		<%=m.getDuration()%>
		phút
	</p>
	<p>
		<b>Đạo diễn:</b>
		<%=m.getDirector()%></p>
	<p>
		<b>Diễn viên:</b>
		<%=m.getCast()%></p>
	<p>
		<b>Tóm tắt:</b>
		<%=m.getSynopsis()%></p>
	<p>
		<b>Trailer:</b> <a href="<%=m.getTrailer()%>">Xem trailer</a>
	</p>
	<img src="<%=m.getPoster()%>" width="300">
	<br>
	<a href="MovieSearchServlet">Quay lại</a>
	<%
		} else {
	%>
	<p>Không tìm thấy phim.</p>
	<%
		}
	%>
</body>
</html>
