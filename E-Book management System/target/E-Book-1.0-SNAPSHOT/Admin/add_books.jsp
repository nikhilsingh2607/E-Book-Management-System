<%-- 
    Document   : add_books
    Created on : 19 Jan, 2024, 6:19:01 PM
    Author     : nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="AllCss.jsp"%>
    </head>
    <body style="background-color: #ededed">
        <%@include file="navBar.jsp"%>
        
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
         <!--OR use below code both will do same work.-->
        <%
//            UserDTO user = (UserDTO)session.getAttribute("userobj");
//            if(user==null)
//            response.sendRedirect("../login.jsp");
        %>
        
        <div class="container p-5 " >
            <div class="row">
                <div class="col-md-4 offset-md-4" >
                    <div class="card" style="border-radius: 13px;outline: 3.1px solid #212529; ">
                        <div class="card-body" >
                            
                            <h4 class="text-center">Add Books</h4>
                            
                            <c:if test="${not empty succMsg}">
                                <h6 class="text-center text-success">${succMsg}</h6>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                                <c:if test="${not empty failedMsg}">
                                <c:remove var="failedMsg" scope="session"/>
                                <h6 class="text-center text-danger">${failedMsg}</h6>
                                </c:if>
                            <hr>
                            
                            <form action="../BooksAdd" method="post" enctype="multipart/form-data">
                               
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
                                
                                 <div class="form-group">
                                    <label for="inputState">Book Categories</label>
                                    <select name="categories" class="form-control" id="inputState" >
                                        <option selected>--select--</option>
                                        <option value="NewBook">New Book</option>
                                    </select>
                                 </div>
                                
                                 <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select name="status" class="form-control" id="inputState" >
                                       <option selected>--select--</option>
                                        <option value="Active">Active</option> 
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <hr>
                                <button type="submit" class="btn btn-primary pl-4 pr-4 offset-md-4 ">Add</button>
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="Footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
