<%-- 
    Document   : sell_book
    Created on : 1 Feb, 2024, 9:07:18 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Book</title>
        <%@include file="All-Components/AllCss.jsp"%>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp"%>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 mt-3">
                    <div class="card">
                        <div class="card-body">
                            
                            <h5 class="text-center text-primary p-1">Sell Old Book</h5>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove scope="session" var="succMsg"></c:remove>
                            </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p clas="text-center text-danger">${failedMsg}</p>
                                <c:remove scope="session" var="failedMsg"></c:remove>
                            </c:if>
                            <form action="AddOldBook" method="post" enctype="multipart/form-data">
                               
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                
                                 <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input name="price" type="number" class="form-control" id="exampleInputPassword1" >
                                </div>
                                
                                     <input type="hidden" name="email" value="${userobj.email}" >
                                
                                
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <hr>
                                <button type="submit" class="btn btn-primary pl-4 pr-4 offset-md-4 ">Sell Book</button>
                                
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        
        <%@include file="All-Components/footer.jsp" %>
    </body>
</html>
