<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký Tài khoản</title>
<style>
/* ... (CSS cho login/register) ... */
</style>
</head>
<body>
	<div class="login-container" style="max-width: 450px;">
		<h2>Đăng Ký Tài Khoản</h2>
		<c:if test="${not empty error}">
			<p class="error-message">${error}</p>
		</c:if>

		<form action="AuthServlet" method="POST">
			<input type="hidden" name="action" value="register">

			<div class="input-group">
				<label for="fullName">Họ và Tên:</label> <input type="text"
					id="fullName" name="fullName" required value="${param.fullName}">
			</div>
			<div class="input-group">
				<label for="username">Tên đăng nhập:</label> <input type="text"
					id="username" name="username" required value="${param.username}">
			</div>
			<div class="input-group">
				<label for="password">Mật khẩu:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="input-group">
				<label for="dateOfBirth">Ngày sinh (YYYY-MM-DD):</label> <input
					type="date" id="dateOfBirth" name="dateOfBirth" required
					value="${param.dateOfBirth}">
			</div>
			<div class="input-group">
				<label for="address">Địa chỉ:</label> <input type="text"
					id="address" name="address" required value="${param.address}">
			</div>
			<div class="input-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required value="${param.email}">
			</div>
			<div class="input-group">
				<label for="phoneNumber">Điện thoại:</label> <input type="text"
					id="phoneNumber" name="phoneNumber" required
					value="${param.phoneNumber}">
			</div>

			<button type="submit" class="login-button">Đăng Ký</button>
		</form>

		<p style="margin-top: 20px;">
			Đã có tài khoản? <a href="gdLogin.jsp">Đăng nhập</a>
		</p>
	</div>
</body>
</html>