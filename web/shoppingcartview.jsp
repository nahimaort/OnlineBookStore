<%-- 
    Document   : ShoppingCartView
    Created on : 10 feb. 2022, 20:24:29
    Author     : nahimaortega
--%>

<%@page import="model.Book"%>
<%@page import="model.ShoppingCart"%>
<%@page import="model.Catalogue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart Page</title>
    </head>
    <body>
        <h1>Items in your Shopping Cart</h1>
        <a href="index.jsp">View catalogue</a><br>
        
        <form action="FrontServlet">
                <input type="hidden" name="command" value="EmptyCartCommand" />
                <input type="submit" value="Empty cart" />
        </form>
        <%  
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            for (Book book : cart.getShoppingCart().keySet()) { 
        %>
        <div>
            <br><strong> Title: <%= book.getTitle() %> </strong><br>
            <img src=<%= book.getThumbnailUrl() %> /><br>
            ISBN: <%= book.getIsbn() %><br>
            Number of pages: <%= book.getPages() %><br>
            Date: <%= book.getParsedDate() %><br>
            Authors: <%= book.getParsedAuthors()%><br>
            Price: <%= book.getPrice() * cart.getCuantity(book) %><br>
            Cuantity: <%= cart.getCuantity(book) %><br>
            <form action="FrontServlet">
                <input type="hidden" name="command" value="AddToCartCommand" />
                <input type="hidden" name="isbn" value=<%= book.getIsbn() %> />
                <input type="submit" value="+" />
            </form>
                
            <form action="FrontServlet">
                <input type="hidden" name="command" value="RemoveFromCartCommand" />
                <input type="hidden" name="isbn" value=<%= book.getIsbn() %> />
                <input type="submit" value="-" />
            </form>
        <% }%>
        </div>
        <a href="purchaseview.jsp">Buy</a>
    </body>
</html>
