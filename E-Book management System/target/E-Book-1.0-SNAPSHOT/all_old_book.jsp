<!-- 
    Document   : all_old_book
    Created on : 24 Jan, 2024, 11:01:54 PM
    Author     : nikhil
-->


<%@page import="java.util.List"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Old books</title>
        <%@include file="All-Components/AllCss.jsp"%>
        <style type="text/css">
           
            .card-hover:hover
            {
                background-color: beige;
            }
            
        </style>
    </head>
    <BODY style="background-color:#ededed">
    <body>
        <%@include file="All-Components/navBar.jsp" %>
        <div class="container ">
            <h3 class="text-center" id="OldBook">Old Books</h3>
            <div class="row p-3">
                <%
                        BookDAOImpl dao3 = new BookDAOImpl(DBConnector.getConnection());
                        List<BookDtlsDTO> list3 = dao3.getAllOldBook();
                        
                        for(BookDtlsDTO b:list3)
                        { %>
                <div class="col-md-3">
                    <div class="card card-hover mt-3">
                        <div class="card-body text-center">
                            <img alt="java book" src="book-img/<%=b.getPhotoName()%>" style="height:175px; width: 135px;" class="img-thumblin">
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
        </div>
    </body>
</html>
