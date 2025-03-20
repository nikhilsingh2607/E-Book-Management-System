<%-- 
    Document   : add_books
    Created on : 19 Jan, 2024, 6:19:01 PM
    Author     : nikhil
--%>

<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Books</title>
        <%@include file="AllCss.jsp"%>
    </head>
    <body style="background-color: #ededed">
        <%@include file="navBar.jsp"%>

        <div class="container p-5 " >
            <div class="row">
                <div class="col-md-4 offset-md-4" >
                    <div class="card" style="border-radius: 13px;outline: 3.1px solid #212529; ">
                        <div class="card-body" >

                            <h4 class="text-center">Edit Books</h4>
                            <hr>
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
                                BookDtlsDTO b = dao.getBookById(id);

                            %>
                            <form action="../EditBooksSevlet" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getBookName()%>">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input name="price" type="number" class="form-control" id="exampleInputPassword1" value="<%=b.getPrice()%>">
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select name="status" class="form-control" id="inputState" >
                                        <% if ("Active".equals(b.getStatus())) {%> 
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%} else {%>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%}%>
                                    </select>
                                </div>
                                <hr>
                                <button type="submit" class="btn btn-primary pl-4 pr-4 offset-md-4 ">Update</button>

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
