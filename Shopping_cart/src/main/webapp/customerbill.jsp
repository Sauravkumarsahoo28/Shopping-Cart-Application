<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="com.jsp.shopping_cart.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Bill</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000000; /* Changed from #f0f0f0 to black */
        color: #FFFFFF; /* Added to change text color to white for better visibility */
        margin: 0;
        padding: 0;
        text-align: center;
    }
    h1 {
        color: #007bff;
        margin-top: 20px;
    }
    h2 {
        margin-top: 10px;
        color: #FFFFFF; /* Changed to white for visibility */
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        color: #FFFFFF; /* Changed text color to white for visibility */
    }
    th {
        background-color: #f2f2f2;
        color: #000000; /* Resetting text color to black for contrast */
    }
</style>
</head>
<body>
<h1>${msg}</h1>
<%
    Orders orders=(Orders)request.getAttribute("orderdetails");
    List<Item> items=orders.getItems();
%>
<h2>Receiver's Name : <%= orders.getName() %> <br>
Receiver's Address : <%= orders.getAddress() %> <br>
Receiver's Mobile Number : <%= orders.getMobilenumber() %> <br>
</h2>
<table>
<tr>
<th>Brand</th>
<th>Model</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
</tr>
<% for(Item i:items){ %>
<tr>
<td><%= i.getBrand() %></td>
<td><%= i.getModel() %></td>
<td><%= i.getCategory() %></td>
<td><%= i.getPrice() %></td>
<td><%= i.getQuantity() %></td>
</tr>
<% } %>
</table>
<h2>Total Price : <%= orders.getTotalprice() %></h2>
</body>
</html>
