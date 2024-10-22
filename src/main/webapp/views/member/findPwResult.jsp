<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 중앙에 배치 */
            background-color: #f9f9f9; /* 배경색 추가 */
        }
        .container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            max-width: 400px;
            width: 100%; /* 반응형 설정 */
            background: white; /* 배경색 흰색으로 설정 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        }
        .message {
            margin: 10px 0;
            color: #333;
        }
        .temp-password {
            font-weight: bold;
            color: #ff6347; /* 주황색으로 강조 */
        }
        .login-button {
            margin-top: 20px; /* 버튼 위 여백 */
            padding: 10px;
            background-color: #ff7f50; /* 주황색 */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%; /* 버튼 너비 100% */
        }
        .login-button:hover {
            background-color: #ff6347; /* 버튼 hover 색상 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>비밀번호 찾기 결과</h3>
        <p class="message">${msg}</p>
        <c:if test="${not empty tempPw}">
            <p class="temp-password">임시 비밀번호: ${tempPw}</p>
        </c:if>
        <form action="login" method="get"> <!-- 로그인 페이지로 이동하는 폼 -->
            <button type="submit" class="login-button">로그인</button>
        </form>
    </div>
</body>
</html>
