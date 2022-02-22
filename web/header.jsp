<%-- 
    Document   : header
    Created on : 21 feb. 2022, 17:30:13
    Author     : nahimaortega
--%>

<%@page import="model.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"> 
        <title>Online Store</title>
    </head>
</html>

<nav> 
    <div class="contact">
        <div class="social-media">
            
            <a href="https://www.instagram.com/?hl=es"><img src="${pageContext.request.contextPath}/images/instagram.png"></a>
            <a href="https://twitter.com/?lang=es"><img src="${pageContext.request.contextPath}/images/twitter.png"></a>
            <a href="https://es-es.facebook.com/"><img src="${pageContext.request.contextPath}/images/facebook2.png"></a>
            <a href="https://www.youtube.com/?hl=ES"><img src="${pageContext.request.contextPath}/images/youtube.png"></a>
            
        </div>
        <div class="phone">
            <span>Telephone number: +(34) 600-000-000 </span>
        </div>
    </div>
    <div class="navigation">
        
        <a href="index.jsp" class="logo"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
        <div class="toggle"></div>
        <ul class="menu">
            <li><a href="index.jsp">Catalogue</a></li>
            <li><a href="">Sales</a></li>
            <li><a href="">About Us</a></li>
            <li><a href="">FAQs</a></li>
        </ul>
        <div class="right-menu">
            <a href="shoppingcartview.jsp" class="shopping-cart">
                <img src="${pageContext.request.contextPath}/images/shopping-cart.png">
            </a>
        </div>
    </div>
</nav>