<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        background-color: #000; /* Set background color to black */
        color: #fff; /* Set text color to white for better contrast */
        font-family: Arial, sans-serif; /* Use a common font for better readability */
        display: flex;
        flex-direction: column; /* Arrange elements vertically */
        justify-content: center; /* Center vertically */
        align-items: center; /* Center horizontally */
        height: 100vh; /* Set full viewport height */
        margin: 0; /* Remove default margin */
        padding: 0; /* Remove default padding */
    }
    a {
        color: #fff; /* Set link color to white */
        text-decoration: none; /* Remove underline from links */
    }
    a:hover {
        text-decoration: underline; /* Add underline on hover */
    }
</style>
</head>
<body>
    <div>
        <h1>${msg}</h1>
    </div>
    <h1>CUSTOMER REGISTER/LOGIN</h1>
    <div>
        <h1><a href="customerregister">Register</a></h1>
    </div>
    <div>
        <h1><a href="customerloginform.jsp">Login</a></h1>
    </div>
</body>
</html>
