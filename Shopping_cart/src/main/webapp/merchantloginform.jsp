<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        background-color: #000;
        color: #fff;
        font-family: Arial, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }
    form {
        background-color: #808080;
        padding: 20px;
        border-radius: 5px;
        width: 300px;
    }
    input[type="text"], input[type="password"] {
        width: calc(100% - 12px);
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <h1>${msg}</h1>
    <form action="loginvalidation" method="post">
        Enter email :<input type="text" name="email">
        Enter password :<input type="password" name="password">
        <input type="submit">
    </form>
</body>
</html>
crf