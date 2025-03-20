<%-- 
    Document   : navBar 
    Created on : 11 Oct, 2023, 6:07:50 PM
    Author     : nikhil
--%>
<style>
    html{
        scroll-behavior:smooth;
    }
    </style>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<div class="container-fluid bg-dark" style="height:15px;"></div>
<div class="container-fluid p-3 bg-custom" >
    <div class="row">
        <div class="col-md-3 text-primary">
           
            <h3> <i class="fa-solid fa-book "> </i> E-Book</h3>
        </div>
        <div class="col-md-6">
            <form action="search.jsp" method="post" class="form-inline my-2 my-lg-0">
                <input class="form-active mr-sm-2" type="search" name="str" placeholder="Search" aria-label="Search">
                <button class="btn btn-second btn-my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        
        <c:if test="${not empty userobj}">
            <div class="col-md-3">
                <a href="checkout.jsp"><i style="font-size:1.6em;margin-right:12px" class=" fa-solid fa-cart-shopping"></i></a>
            <a href="" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userobj.name } </a>
            <a href="LogoutServlet" class="btn btn-primary"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
        </c:if>
        <c:if test="${empty userobj}">
        <div class="col-md-3">
            <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="registration.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
        </div>
        </c:if>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fa-solid fa-book-open-reader"></i> Recent Book <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-book-open-reader"></i> New Book <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_old_book.jsp"><i class="fa-solid fa-book-open-reader"></i> Old Book <span class="sr-only">(current)</span></a>
            </li>
            </ul>
        </div>
    
            <form class="form-inline my-2 my-lg-0">
                <a href="setting.jsp" class="btn btn-outline-primary my-2 my-sm-0" type="submit">
            <i class="fas fa-cog"></i> Settings
        </a>
      <button class="btn btn-outline-primary  my-2 my-sm-0 ml-1" type=""><i class="fa-solid fa-phone-volume"></i>  Contact Us</button>
    </form>
        
    <!--btn-light-->
</nav>
