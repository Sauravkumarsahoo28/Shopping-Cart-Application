<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        background-color: #000; /* Body background color as black */
        color: #fff; /* Body text color as white */
        font-family: Arial, sans-serif; /* Ensures text uses a readable font */
    }
    .form-container {
        background-color: #fff; /* Form background color as white */
        padding: 20px;
        border-radius: 8px;
        margin: auto;
        width: fit-content;
        color: #000; /* Form text color as black */
    }
    input[type="text"], input[type="submit"] {
        margin: 10px 0; /* Adds space between form fields */
        padding: 8px;
        width: 100%; /* Makes input fields fill the form */
        box-sizing: border-box; /* Includes padding and border in the element's total width and height */
    }
    input[type="text"] {
        background-color: #fff; /* Background color for text inputs */
        color: #000; /* Text color for text inputs */
        border: 1px solid #ccc; /* Border for text inputs */
    }
    input[type="submit"] {
        background-color: #4CAF50; /* A green background for the submit button */
        color: #fff; /* White text for the button */
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049; /* Darken the button on hover */
    }
</style>
</head>
<body>
    <div class="form-container">
        <form:form action="savecustomer" modelAttribute="customerobj">
        <h1>CUSTOMER REGISTER</h1>
            <div>Enter Name :<form:input path="name"/></div>
            <div>Enter Address:<form:input path="address"/></div>
            <div>Enter Mobile Number:<form:input path="mobilenumber"/></div>
            <div>Enter email:<form:input path="email"/></div>
            <div>Enter Password:<form:input path="password"/></div>
            <input type="submit" value="Submit">
        </form:form>
    </div>
</body>
</html>
