<%-- 
    Document   : login
    Created on : 13 Oct, 2023, 11:25:53 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book: Login</title>
        <%@include file="All-Components/AllCss.jsp" %>      
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp" %>

        <div class="container-fluid mt-4" >
            <div class="row">
                <div class="col-md-3 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Login </h3>
                            
                            <c:if test="${not empty failedMsg}">
                                <h6 class="text-center text-danger">${failedMsg}</h6>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                                <c:if test="${not empty succMsg}">
                                    <h6 class="text-center text-success">${succMsg}</h6>
                                <c:remove var="succMsg" scope="session"/>
                                </c:if>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter E-mail</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1 " required="required" name="password">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <br>
                                    <a href="registration.jsp">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
         
        <%@include file="All-Components/footer.jsp" %>
    </body>
</html>
