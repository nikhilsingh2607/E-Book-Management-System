<%-- 
    Document   : edit_profile
    Created on : 1 Feb, 2024, 9:23:35 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed" >
        <%@include file="All-Components/navBar.jsp" %>
        <c:if test="${ empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:if test="${not empty succMsg1}">
            <div class="alert alert-success text-center">${succMsg1}</div>
            <c:remove var="succMsg1" scope="session"></c:remove>
        </c:if>
        <c:if test="${not empty failedMsg1}">
            <div class="alert alert-danger text-center">${failedMsg1}</div>
            <c:remove var="failedMsg1" scope="session"></c:remove>
        </c:if>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary">Edit profile</h5>
                               <form action="UpdateProfileServlet" method="post">
                                   <input type="hidden" name="userId" value="${userobj.id}">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full Name </label>
                                    <input type="text" name="name" value="${userobj.name}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" value="${userobj.email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input type="number" name="phone" value="${(userobj.phone)}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Old Password</label>
                                    <input type="password" name="oldPassword" class="form-control" id="exampleInputPassword1" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>
                                    <input type="password" name="newPassword" class="form-control" id="exampleInputPassword1" required="required">
                                </div>
                                
                                <div class="text-center">
                                    <button  type="submit" class="btn btn-primary">Update</button>
                                <button type="reset" class="btn btn-success">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="All-Components/footer.jsp" %>%>
    </body>
</html>
