<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jsp.shopping_cart.dto.*" %>
      <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Product p=(Product)request.getAttribute("prodobj"); %>

<form action="additemtocart">
<input type="hidden" name="id" value="<%=p.getId() %>" readonly="true"> 
<!-- Hidden form field ,this data will not be shown to the user..-->

Brand : <input type="text" name="brand" value="<%=p.getBrand() %>" readonly="true"><br>
Category :<input type="text" name="category" value="<%= p.getCategory() %>" readonly="true"><br>
Model : <input type="text" name="model" value="<%= p.getModel() %>" readonly="true"><br>
Price : <input type="text" name="price" value="<%= p.getPrice() %>" readonly="true"><br>
Quantity : <input type="number" name="quantity"><br>

<input type="submit" value="ADD TO CART">
</form>
</body>
</html>