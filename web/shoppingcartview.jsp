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
        <link rel="stylesheet" type="text/css" href="style.css">  
        <title>Shopping Cart Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>  
        <h1>Items in your Shopping Cart</h1>
        
        <div class="empty-cart">
        <form action="FrontServlet">
                <input type="hidden" name="command" value="EmptyCartCommand" />
                <input type="submit" value="Empty cart" />
        </form>
        </div>
        <section class="book-display">
        <%  
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        %>
        <div class="product-container-sc">
        <%
            for (Book book : cart.getShoppingCart().keySet()) { 
        %>
            <div class="product-box-sc">
                <br><strong> Title: <%= book.getTitle() %> </strong><br>
                <div class="product-img">
                    <img src=<%= book.getThumbnailUrl() %> /><br>
                </div>
                <div class="product-details">
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
                </div>
            </div>
        <% }%>
        </div>
        <div class="buy-now">
            <a href="purchaseview.jsp"><img src="${pageContext.request.contextPath}/images/buy-now.png"></a>
        </div>
        
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
