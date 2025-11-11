<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký Tài khoản</title>
<style>
/* Sử dụng lại CSS của gdLogin.jsp để đồng bộ */
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f9;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px; /* Thêm padding để không bị tràn màn hình */
        min-height: 100vh;
        margin: 0;
    }
    .login-container {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        width: 450px; /* Tăng chiều rộng để chứa nhiều trường hơn */
        text-align: center;
    }
    h2 {
        color: #343a40;
        margin-bottom: 25px;
        border-bottom: 2px solid #28a745; /* Đổi màu chủ đạo */
        padding-bottom: 10px;
    }
    .input-group {
        margin-bottom: 15px;
        text-align: left;
    }
    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 600;
        color: #495057;
    }
    .input-group input[type="text"],
    .input-group input[type="password"],
    .input-group input[type="email"],
    .input-group input[type="date"] {
        width: 100%;
        padding: 10px;
        font-size: 1em;
        border: 1px solid #ced4da;
        border-radius: 6px;
        box-sizing: border-box;
    }
    .error-message {
        color: #dc3545;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 15px;
        font-weight: 500;
    }
    .login-button {
        background-color: #28a745; /* Màu xanh lá cho nút Đăng ký */
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 1.1em;
        width: 100%;
        margin-top: 10px;
        transition: background-color 0.2s;
    }
    .login-button:hover {
        background-color: #1e7e34;
    }
    .register-link {
        display: block;
        margin-top: 20px;
        font-size: 0.9em;
    }
    .register-link a {
        color: #007bff;
        text-decoration: none;
        font-weight: 600;
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Đăng Ký Tài Khoản</h2>
    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>

    <form action="AuthServlet" method="POST">
        <input type="hidden" name="action" value="register">
        
        <div class="input-group">
            <label for="fullName">Họ và Tên:</label>
            <input type="text" id="fullName" name="fullName" required value="${param.fullName}">
        </div>
        <div class="input-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required value="${param.username}">
        </div>
        <div class="input-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-group">
            <label for="dateOfBirth">Ngày sinh (YYYY-MM-DD):</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required value="${param.dateOfBirth}">
        </div>
        <div class="input-group">
            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address" required value="${param.address}">
        </div>
        <div class="input-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required value="${param.email}">
        </div>
         <div class="input-group">
            <label for="phoneNumber">Điện thoại:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required value="${param.phoneNumber}">
        </div>

        <button type="submit" class="login-button">Đăng Ký</button>
    </form>
    
    <div class="register-link">
        Đã có tài khoản? <a href="gdLogin.jsp">Đăng nhập</a>
    </div>
</div>
</body>
</html>