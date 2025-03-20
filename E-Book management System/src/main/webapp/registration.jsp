<%-- 
    Document   : reegistration
    Created on : 13 Oct, 2023, 10:57:14 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book: Registration</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed">
        <%@include file="All-Components/navBar.jsp" %>
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="col-md-4 offset-md-4 ">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center ">Registration Page</h3>
                            
                            <c:if test="${not empty succMsg }">
                                <h6 class="text-center text-success">${succMsg }</h6> 
                                <c:remove var="succMsg" scope="session"/>
                                
                            </c:if>
                                <c:if test="${not empty failedMsg}">
                                    <h6 class="text-center text-danger">${failedMsg }</h6> 
                                <c:remove var="failedMsg" scope="session"/>
                                </c:if>
                            
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Full Name </label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input type="number" name="phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Confirm Password</label>
                                    <input type="password" name="confirmpass" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                                </div>
                                <div class="form-check text-center">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms And Condition</label>
                                </div>
                                <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-success">Reset</button>
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
