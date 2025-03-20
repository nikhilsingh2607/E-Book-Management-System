<%-- 
    Document   : setting
    Created on : 1 Feb, 2024, 8:28:41 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <%@include file="All-Components/AllCss.jsp"%>
        <style>
            #a{
                text-decoration: none;
                color: black;
            }
            #a:hover
            {
                text-decoration: none;
                color: #007bff;
            }
        </style>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp"%>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <div class="container">
            
            <h3 class="text-center mt-1">Hello, ${userobj.name}!</h3>
            
            <div class="row p-5">
                <div class="col-md-4">
                    <a id="a" href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-book-open fa-3x"></i>
                                </div><br>
                                <h3>Sell Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a id="a" href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-book-open fa-3x"></i>
                                </div><br>
                                <h3> Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 ">
                    <a id="a" href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-address-card fa-3x"></i>
                                </div><br>
                                <h4>Edit Profile</h4>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a id="a" href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fa-solid fa-location-dot fa-3x"></i>
                                </div>
                                <h3>Your Address</h3>
                                <p>Edit Address</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a id="a" href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fa-solid fa-bag-shopping fa-3x"></i>
                                </div>
                                <h3>My Orders</h3>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a id="a" href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-headset fa-3x"></i>
                                </div>
                                <h3>Help Centre</h3>
                                <p>24*7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <%@include file="All-Components/footer.jsp" %>
    </body>
</html>
