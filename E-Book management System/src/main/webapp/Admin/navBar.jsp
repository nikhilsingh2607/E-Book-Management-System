<%-- 
    Document   : navBar 
    Created on : 11 Oct, 2023, 6:07:50 PM
    Author     : nikhil
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<div class="container-fluid bg-dark" style="height:15px;"></div>
<div class="container-fluid p-3 bg-custom" >
    <div class="row">
        <div class="col-md-3 text-primary">
           
            <h3> <i class="fa-solid fa-book "> </i> E-Book</h3>
        </div>
        

        <div class="col-md-3">
            
            <c:if test="${not empty userobj}">
            <a href="" class="btn btn-success "><i class="fa-solid fa-user-tie"></i> ${userobj.name}</a>
            <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>                
            </c:if>
            <c:if test=" ${empty userobj}">
            <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                      
            <a href="../registration.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
                </c:if>
        </div>
    </div>
</div>

<!--Logout Model-->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<h5 class="modal-title" id="exampleModalLongTitle"></h5>-->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="text-center">
          <h4>Did you really want to log out?</h4>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <a href="../LogoutServlet" type="button" class="btn btn-primary text-white">Log out</a>
        </div>
      </div>
      <div class="modal-footer">
              
      </div>
    </div>
  </div>
</div>
<!--end of Logout Model-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="Home.jsp"> Home <span class="sr-only">(current)</span></a>
            </li>
    
        
    <!--btn-light-->
</nav>
