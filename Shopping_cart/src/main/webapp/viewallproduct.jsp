<%@page import="com.jsp.shopping_cart.dto.Merchant"%>
<%@page import="com.jsp.shopping_cart.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        background-color: #000; /* Page background color changed to black */
        color: #fff; /* General text color changed to white for visibility */
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    table {
        background-color: #fff; /* Table background color set to white */
        border-collapse: collapse;
        width: 80%;
        margin: auto;
    }
    th, td {
        padding: 15px; /* Increased padding for better readability */
        border: 1px solid #000; /* Border color set to black */
        text-align: center;
        font-size: 18px; /* Text size increased for better readability */
        color: #000; /* Text color inside table set to black */
    }
    th {
        background-color: #333;
        color: #fff; /* Text color for table headers is white */
    }
    td a {
        color: #000; /* Links color set to black */
        text-decoration: none;
    }
    td a:hover {
        color: #ff0000; /* Link color changes to red on hover */
    }
</style>
</head>
<body>
    <% 
        Merchant m = (Merchant) session.getAttribute("merchantinfo");
        List<Product> p = m.getProducts();
    %>
    <table>
        <tr>
            <th>id</th>
            <th>brand</th>
            <th>model</th>
            <th>category</th>
            <th>price</th>
            <th>stock</th>
            <th>update</th>
            <th>delete</th>
        </tr>
        <% for (Product product : p) { %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getBrand() %></td>
                <td><%= product.getModel() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td><a href="updateproduct" class="update">update</a></td>
                <td><a href="deleteproduct?id=<%= product.getId() %>" class="delete">delete</a></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
