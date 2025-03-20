<%-- 
    Document   : index
    Created on : 11 Oct, 2023, 5:46:33 PM
    Author     : nikhil
--%>
<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book: Index Page.</title>
        <%@include file="All-Components/AllCss.jsp" %>
        <style type="text/css">
            .back-img
            {
                background: url('image/book.jpg');
                height: 80vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .card-hover:hover
            {
                background-color: beige;
            }
            
        </style>
    </head>
    <BODY style="background-color:#ededed">
        <!--navigation bar-->
        <%@include file="All-Components/navBarForHome.jsp" %>

        <!--background image-->
        <div class="container-fluid back-img ">
            <h2 class="text-center" style="color: #ededed">E-Book Management System</h2>
        </div>

        <%
            UserDTO user = (UserDTO)session.getAttribute("userobj");
        %>
        
        <!--Start Recent Book-->
        <br>
        
        <div class="container ">
            <h3 class="text-center" id="RecentBook">Recent Books</h3>
            <div class="row">
                <%
                BookDAOImpl dao1 = new BookDAOImpl(DBConnector.getConnection());
                
                List<BookDtlsDTO> list1 = dao1.getRecentBook();
                
                for(BookDtlsDTO b:list1)
                {
                %>
                <div class="col-md-3">
                    <div class="card card-hover">
                        <div class="card-body text-center ">
                            <img alt="java book" src="book-img/<%=b.getPhotoName()%>" style="height:200px; width: 150px;" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                <%if(b.getBookCategory().equals("NewBook"))
                                {                                
                                if(user==null) {
                                %>
                                <a href="login.jsp" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <% }
                                else{
                                %>
                                <a href="CartServlet?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                               <%}%>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm btn-primary ml-1">View Details</a>
                                <a href="" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                                <%} else {%>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm btn-primary ml-5">View Details</a>
                                <a href="" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="text-center mt-2">
                <a href="all_recent_book.jsp" class="btn btn-sm btn-primary">View All</a>  
            </div>  
        </div>

        <hr>
        <!--Start New Book-->
        <div class="container ">
            <h3 class="text-center" id="NewBook">New Books</h3>
            <div class="row">
                
                    <%
                        BookDAOImpl dao2 = new BookDAOImpl(DBConnector.getConnection());
                        List<BookDtlsDTO> list2 = dao2.getNewBook();
                        
                        for(BookDtlsDTO b:list2)
                        { %>
                         <div class="col-md-3">
                           <div class="card card-hover ">
                        <div class="card-body text-center ">
                            <img alt="java book" src="book-img/<%=b.getPhotoName()%>" style="height:200px; width: 150px;" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                <%
                                if(user==null) {
                                %>
                                <a href="login.jsp" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <% }
                                else{
                                %>
                                <a href="CartServlet?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                               <%}%>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm btn-primary ml-1">View Details</a>
                                <a href="" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>

                            </div>
                        </div>
                    </div> 
                                </div>
                       <% }
                    %>
                    
                
            </div>
            <div class="text-center mt-2">
                <a href="all_new_book.jsp" class="btn btn-sm btn-primary">View All</a>  
            </div>  
        </div>

        <hr>
        <!--Start Old Book-->
        
        <div class="container ">
            <h3 class="text-center" id="OldBook">Old Books</h3>
            <div class="row">
                <%
                        BookDAOImpl dao3 = new BookDAOImpl(DBConnector.getConnection());
                        List<BookDtlsDTO> list3 = dao3.getOldBook();
                        
                        for(BookDtlsDTO b:list3)
                        { %>
                <div class="col-md-3">
                    <div class="card card-hover">
                        <div class="card-body text-center">
                            <img alt="book image" src="book-img/<%=b.getPhotoName()%>" style="height:200px; width: 150px;" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                <!--<a href="" class="btn btn-sm btn-danger ml-1">Add To Cart</a>-->
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm btn-primary ml-5">View Details</a>
                                <a href="" class="btn btn-sm btn-danger ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>

                            </div>
                        </div>
                    </div>
                </div>
                                <%}%>

            </div>
            <div class="text-center mt-2">
                <a href="all_old_book.jsp" class="btn btn-sm btn-primary">View All</a>  
            </div>  
        </div>
        
        <!--Footer-->
        <%@include file="All-Components/footer.jsp" %>
    </body>
</html>
