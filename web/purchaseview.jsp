<%-- 
    Document   : PurchaseView
    Created on : 10 feb. 2022, 20:25:32
    Author     : nahimaortega
--%>

<%@page import="model.Receipt"%>
<%@page import="model.Book"%>
<%@page import="model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"> 
        <title>Purchase Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>  
        <h1>Purchase Overview</h1>
        <%  
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Receipt receipt = new Receipt(cart);
            for (Book book : cart.getShoppingCart().keySet()) { 
        %>
        <br><%= cart.getCuantity(book) %> <%= book.getTitle() %>......... <%= book.getPrice() * cart.getCuantity(book) %>
        <% } %>
        <br>Base total: <%= receipt.getPriceWithoutIGIC() %><br>
        I.G.I.C. (7%): <%= receipt.calculateIGIC(receipt.getPriceWithoutIGIC()) %><br>
        <h2>Total: <%= receipt.getTotalAmount() %></h2><br>
         <form action="FrontServlet">
                <input type="hidden" name="command" value="PerformPurchaseCommand" />
                <input type="submit" value="Purchase" />
         </form>
         <jsp:include page="footer.jsp"/>
    </body>
</html>
