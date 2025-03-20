<%-- 
    Document   : all_new_book
    Created on : 24 Jan, 2024, 11:01:34 PM
    Author     : nikhi
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
        <title>All New Books</title>
        <%@include file="All-Components/AllCss.jsp"%>
        <style type="text/css">

            .card-hover:hover
            {
                background-color: beige;
            }

            
            
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #28a745;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 2px 2px 100px #000;
        border-radius: 30px;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
        </style>
    </head>
    <BODY style="background-color:#ededed">
    <body>
<% 
    UserDTO user = (UserDTO)session.getAttribute("userobj");
%>
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>
            <script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script> 
            <c:remove var="addCart" scope="session"/>
        </c:if>

        <%@include file="All-Components/navBar.jsp" %>
        <div class="container ">
            <h3 class="text-center mt-2" id="NewBook">New Books</h3>
            <div class="row p-3">

                <%
                    BookDAOImpl dao2 = new BookDAOImpl(DBConnector.getConnection());
                    List<BookDtlsDTO> list2 = dao2.getAllNewBook();

                    for (BookDtlsDTO b : list2) {%>
                <div class="col-md-3">
                    <div class="card card-hover mt-3">
                        <div class="card-body text-center ">
                            <img alt="java book" src="book-img/<%=b.getPhotoName()%>" style="height:175px; width: 135px;" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                <% if(user==null) {
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

        </div>
    </body>
</html>
