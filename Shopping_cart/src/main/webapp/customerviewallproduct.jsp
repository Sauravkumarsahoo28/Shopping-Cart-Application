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
<%
List<Product> products=(List<Product>)request.getAttribute("products");
%>
<h2><a href="fetchitemsfromcart"><button>View Cart</button></a></h2>
<table cellpadding="20px" border="1">
<tr>
<th>ID</th>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Price</th>
<th>Stocks</th>
<th>Add to Cart</th>
</tr>
<%for(Product p:products){ %>
<tr>
<td><%=p.getId() %></td>
<td><%=p.getBrand() %></td>
<td><%=p.getModel() %></td>
<td><%=p.getCategory() %></td>
<td><%=p.getPrice() %></td>
<td><%=p.getStock() %></td>
<td><a href="additem?id=<%= p.getId()%>"><button>Add To Cart</button></a></td>
</tr>
<%} %>
</table>
</body>
</html>