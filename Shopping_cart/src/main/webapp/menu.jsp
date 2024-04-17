<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000; 
        color: #fff; 
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    h1 {
        color: #fff; 
    }
    a {
        text-decoration: none;
        color: #000;
        background-color: #fff; 
        padding: 10px 20px;
        border-radius: 5px;
        margin-top: 10px; 
        box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* Optional: add a little shadow for better contrast */
    }
    a:hover {
        background-color: #e0e0e0; /* Light grey for hover state for a subtle effect */
        color: #000; /* Ensure text color remains black for readability */
    }
</style>
</head>
<body>
    <h1>${msg}</h1>
    <h1>MERCHANT CAN START FROM HERE</h1>
    <h1><a href="register">Register</a></h1>
    <h1><a href="merchantloginform.jsp">Login</a></h1>
</body>
</html>

