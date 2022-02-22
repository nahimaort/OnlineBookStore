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
        <link rel="stylesheet" href="style.css"> 
        <title>Book catalogue</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>  
        
        <%! 
            Catalogue catalogue = new Catalogue("/Users/nahimaortega/NetBeansProjects/OnlineStore/books_ulr.json");
        %>
        
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
           
            session.setAttribute("catalogue", catalogue);
        %>
        
    <section class="book-display">   
        <h1>Book Catalogue</h1>
        <div class="product-container">
            <%
                for (Book book : catalogue.getCatalogue()) { 
            %>
            <div class="product-box">
                <br><strong> Title: <%= book.getTitle() %> </strong><br>
                <div class="product-img">
                    <img src=<%= book.getThumbnailUrl() %> /><br>
                </div>
                <div class="product-details">
                    ISBN: <%= book.getIsbn() %><br>
                    Number of pages: <%= book.getPages() %><br>
                    Date: <%= book.getParsedDate() %><br>
                    Authors: <%= book.getParsedAuthors()%><br>
                    Price <%= book.getPrice() %><br>
                    <form action="FrontServlet">
                        <input type="hidden" name="command" value="AddToCartCommand" />
                        <input type="hidden" name="isbn" value=<%= book.getIsbn() %> />
                        <input type="submit" value="Add to cart" class="add-cart"/>
                    </form>
                </div>
            </div>   
            <% }%>
        </div>
        
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
</html>


 