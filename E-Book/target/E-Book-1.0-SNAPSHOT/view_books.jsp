<%-- 
    Document   : view_books
    Created on : 25 Jan, 2024, 10:39:59 PM
    Author     : nikhi
--%>

<%@page import="DAO.BookDAOImpl"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Books</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed;">
        <%@include file="All-Components/navBar.jsp" %>
        <%
        BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDtlsDTO b = dao.getBookById(bid);
        %>
        <div class="container p-3">
            <div class="row p-5">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book-img/<%=b.getPhotoName()%>" class="mb-3" style="height:150px; width:150px"><br>
                    <h5>Book Name: <span class="text-success"><%=b.getBookName()%></span></h5>
                    <h5>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h5>
                    <h5>Category: <span class="text-success"><%=b.getBookCategory()%></span></h5>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>
                    <%if(b.getBookCategory().equals("OldBook")){%>
                    <h5 class="text-primary">Contact To Seller</h5>
                    <h5 class="text-primary"><i class="fa-solid fa-envelope"></i>Email: <%=b.getEmail()%></h5>
                    <%}%>
                    <div class="row mt-4">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-sack-dollar fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                           <i class="fa-solid fa-truck fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>                        
                    </div>
                    <%if(b.getBookCategory().equals("NewBook"))
                {%>
                    <div class="text-center">
                        <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>
                    <%}
                else {%>
                  <div class="text-center">
                      <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>
                 <%}%> 
                </div>
                 
            </div> 
        </div>
    </body>
</html>
