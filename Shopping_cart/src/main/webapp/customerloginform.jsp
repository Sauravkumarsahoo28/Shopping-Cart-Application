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
        font-family: Arial, sans-serif; /* Ensures text uses a readable font */
        font-size: 16px; /* Slightly larger text for better readability */
        background-color: #000; /* Keeps body background color as black */
        color: #fff; /* Keeps body text color as white for contrast */
        display: flex;
        justify-content: center; /* Center the form horizontally */
        align-items: center; /* Center the form vertically */
        height: 100vh;
        margin: 0;
    }
    form {
        background-color: #fff; /* White background for the form */
        padding: 20px;
        border-radius: 8px; /* Adds rounded corners to the form */
        box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* Adds a subtle shadow to the form */
        width: 300px; /* Sets a fixed width for the form */
        color: #000; /* Black text color for readability */
    }
    input[type="text"], input[type="submit"] {
        width: 100%; /* Makes input fields fill the form */
        padding: 8px;
        margin: 10px 0; /* Adds space between form fields */
        box-sizing: border-box; /* Includes padding and border in the element's total width and height */
        background-color: #fff; /* Keeps input background as white */
        color: #000; /* Black text color for inputs */
        border: 1px solid #ccc; /* Light gray border for inputs */
    }
    input[type="submit"] {
        background-color: #4CAF50; /* A green background for the submit button */
        color: white; /* White text for the button */
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049; /* Darken the button when hovering */
    }
</style>
</head>
<body>
    <h1>${msg}</h1>
    <form action="customerloginvalidation" method="post">
    <h1>CUSTOMER LOGIN</h1>
        <div>Enter email: <input type="text" name="email"></div>
        <div>Enter password: <input type="text" name="password"></div>
        <input type="submit" value="Login">
    </form>
</body>
</html>
