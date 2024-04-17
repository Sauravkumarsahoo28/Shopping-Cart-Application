<%@page import="com.jsp.shopping_cart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored= "false"%>
    
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
    .form-container {
        background-color: #808080;
        padding: 20px;
        border-radius: 5px;
        width: 300px;
    }
    .form-container h1 {
        margin-bottom: 20px;
    }
    a {
        text-decoration: none;
        color: white;
    }
    a:hover {
        color: #c0c0c0;
    }
</style>
</head>
<body>
    <% Merchant m  =(Merchant) session.getAttribute("merchantinfo"); %>
    <div class="form-container">
        <% if(m != null) { %>
            <h1><a href="addproduct">Add Product</a></h1>
            <h1><a href="viewallproduct.jsp">View All Product</a></h1>
        <% } else { %>
            <h1><a href="merchantloginform.jsp">Login First</a></h1>
        <% } %>
    </div>
</body>
</html>
