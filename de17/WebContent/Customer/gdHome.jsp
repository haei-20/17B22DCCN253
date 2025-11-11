<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ Hệ Thống</title>
<style>
    body { 
        font-family: Arial, sans-serif; 
        background-color: #f4f6f9; 
        text-align: center;
        padding-top: 50px;
    }
    .container {
        width: 80%;
        max-width: 600px;
        margin: auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #343a40;
        margin-bottom: 30px;
    }
    .func-button {
        display: block;
        width: 80%;
        padding: 15px;
        margin: 15px auto;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        font-size: 1.2em;
        border-radius: 6px;
        transition: background-color 0.3s;
        font-weight: bold;
    }
    .func-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Chào Mừng</h1>
    
    <a href="${pageContext.request.contextPath}/MovieSearchServlet?action=SEARCH_FORM" 
       class="func-button">
        Tìm Kiếm Phim (Search Movie)
    </a>
    
    </div>

</body>
</html>