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
<%List<Item> items=(List<Item>)request.getAttribute("itemslist");
double totalprice=(double)request.getAttribute("totalprice");
%>
<table cellpadding="20px" border="1">
<tr>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Quantity</th>
<th>Price</th>
<th>Remove Item</th>
</tr>
<%for(Item p:items){ %>
<tr>
<td><%=p.getBrand() %></td>
<td><%=p.getModel() %></td>
<td><%=p.getCategory() %></td>
<td><%=p.getQuantity() %></td>
<td><%=p.getPrice() %></td>
<td><a href="removeitem?id=<%=p.getId()%>">remove</a></td>
</tr>
<%} %>
</table>
<h3>Total  Price : <%=totalprice %></h3>
<h2><a href="addorder"><button style="background-color: aqua;">Buy Now</button></a></h2>
</body>
</html>