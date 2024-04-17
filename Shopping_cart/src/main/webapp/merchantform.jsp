<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body, html {
        height: 100%; /* Ensure the parent elements are full height */
        margin: 0;
        padding: 0;
        background-color: #000; /* Set body background to black */
        color: #fff; /* Set text color to white for better visibility */
        font-family: Arial, sans-serif; /* Improve font readability */
    }
    .centered-container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center; /* Center the heading text */
        width: 300px; /* Match the form width for alignment */
    }
    .form-container {
        background-color: #808080; /* Set form background to grey */
        padding: 20px;
        border-radius: 5px;
        margin-top: 20px; /* Space between heading and form */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Adds a shadow for better depth */
    }
    input[type="submit"] {
        background-color: #4CAF50; /* Green background for the submit button */
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%; /* Make submit button match form width */
        box-sizing: border-box; /* Include padding and border in the element's width */
    }
    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green on hover */
    }
    input[type="text"], input[type="password"], input[type="email"] {
        margin-bottom: 10px; /* Adds spacing between inputs */
        padding: 8px;
        border-radius: 4px;
        border: 1px solid #ccc; /* Adds a border to the inputs */
        width: 100%; /* Match width to container, adjusting for padding */
        box-sizing: border-box; /* Include padding and border in the element's width */
    }
</style>
</head>
<body>
    <div class="centered-container">
        <h1>MERCHANT REGISTER FORM</h1>
        <div class="form-container">
            <form:form action="savemerchant" modelAttribute="merchantobj1">
                <div>Enter Name :<form:input path="name" type="text"/></div>
                <div>Enter Mobile Number:<form:input path="mobilenumber" type="text"/></div>
                <div>Enter email:<form:input path="email" type="email"/></div>
                <div>Enter Password:<form:input path="password" type="password"/></div>
                <input type="submit" value="Submit">
            </form:form>
        </div>
    </div>
</body>
</html>


