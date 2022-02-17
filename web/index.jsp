<%-- 
    Document   : CatalogView
    Created on : 10 feb. 2022, 23:03:19
    Author     : nahimaortega
--%>

<%@page import="model.ShoppingCart"%>
<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Catalogue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book catalogue</title>
    </head>
    <body>
        <h1>Book Catalogue</h1>
        
        
        
        <%! 
            ShoppingCart cart = new ShoppingCart();
            Catalogue catalogue = new Catalogue("/Users/nahimaortega/NetBeansProjects/OnlineStore/books_ulr.json");
        %>
        
        <%
            session.setAttribute("cart", cart);
            session.setAttribute("catalogue", catalogue);
            %>
        
        <a href="shoppingcartview.jsp">View Cart</a>
        
        <%
            for (Book book : catalogue.getCatalogue()) { 
        %>
        <div>
            <br><strong> Title: <%= book.getTitle() %> </strong><br>
            <img src=<%= book.getThumbnailUrl() %> /><br>
            ISBN: <%= book.getIsbn() %><br>
            Number of pages: <%= book.getPages() %><br>
            Date: <%= book.getParsedDate() %><br>
            Authors: <%= book.getParsedAuthors()%><br>
            Price <%= book.getPrice() %><br>
            <form action="FrontServlet">
                <input type="hidden" name="command" value="AddToCartCommand" />
                <input type="hidden" name="isbn" value=<%= book.getIsbn() %> />
                <input type="submit" value="Add to cart" />
            </form>
        <% }%>
        </div>
    </body>
</html>
