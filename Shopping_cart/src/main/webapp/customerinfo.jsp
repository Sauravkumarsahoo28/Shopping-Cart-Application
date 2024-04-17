<%@page import="com.jsp.shopping_cart.dto.Customer"%>
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
        background-color: #000; /* Set the background color to black */
        color: #fff; /* Set the text color to white */
        font-family: Arial, sans-serif; /* Use a common, readable font */
    }
    a {
        color: #fff; /* Set the link color to white */
        text-decoration: none; /* Remove underline from links */
    }
    a:hover {
        color: #ff0000; /* Change link color to red on hover */
    }
    h2 a {
        display: block; /* Make the entire area of the <a> clickable */
        margin: 10px 0; /* Add some spacing between links */
    }
</style>
</head>
<body>
<% Customer c= (Customer)session.getAttribute("customerinfo"); %>
<% if(c!= null){ %>

<h2><a href="displayallproduct">Display All Product</a></h2>
<h2><a href="displayproductsbybrand">Display Product By Brand</a></h2>
<h2><a href="displayproductsbycategory">Display product By category</a></h2>
<h2><a href="displaybetweenrange">Display Product Between Range</a></h2>

<%} else { %>
<h1><a href="customerloginform.jsp">Please login first</a></h1>

<%} %>
</body>
</html>
