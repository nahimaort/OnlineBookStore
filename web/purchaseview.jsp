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
        <title>Purchase Page</title>
    </head>
    <body>
        <h1>Purchase Overview</h1>
        <%  
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Receipt receipt = new Receipt(cart);
            for (Book book : cart.getShoppingCart().keySet()) { 
        %>
        <%= cart.getCuantity(book) %> <%= book.getTitle() %>......... <%= book.getPrice() * cart.getCuantity(book) %>
        <% } %>
        <br>Base total: <%= receipt.getPriceWithoutIGIC() %><br>
        I.G.I.C. (7%): <%= receipt.calculateIGIC(receipt.getPriceWithoutIGIC()) %><br>
        <h2>Total: <%= receipt.getTotalAmount() %></h2><br>
         <form action="FrontServlet">
                <input type="hidden" name="command" value="PerformPurchaseCommand" />
                <input type="submit" value="Complete purchase" />
         </form>
    </body>
</html>
