<%-- 
    Document   : all_recent_book
    Created on : 24 Jan, 2024, 11:01:11 PM
    Author     : nikhil
--%>

<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Recent Books</title>
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
        <div class="container-fluid">
            <%
            UserDTO user = (UserDTO)session.getAttribute("userobj");
        %>
            <h3 class="text-center" id="RecentBook">Recent Books</h3>
            <div class="row p-3">
                    <%
                        BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
                        List<BookDtlsDTO> list = dao.getAllRecentBook();
                        for(BookDtlsDTO b :list)
                        {
                    %>
                <div class="col-md-3">
                     <div class="card card-hover mt-3">
                        <div class="card-body text-center ">
                            <img alt="java book" src="book-img/<%=b.getPhotoName()%>" style="height:175px; width: 135px;" class="img-thumblin">
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
        </div>
    </body>
</html>
