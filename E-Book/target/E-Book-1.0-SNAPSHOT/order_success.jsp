<%-- 
    Document   : order_success
    Created on : 3 Feb, 2024, 9:41:39 PM
    Author     : nikhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp" %>
        
        <div class="container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Placed Successfully</h2>
            <h5>with-in 7 working days your product will be delivered on your address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
    </body>
</html>
