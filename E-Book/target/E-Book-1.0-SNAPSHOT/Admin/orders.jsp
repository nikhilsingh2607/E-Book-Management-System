<%-- 
    Document   : all_books
    Created on : 19 Jan, 2024, 6:31:39 PM
    Author     : nikhil
--%>

<%@page import="dto.BookOrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookOrderDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Orders</title>
        <%@include file="AllCss.jsp"%>
        
    </head>
    <body>
        <%@include file="navBar.jsp"%>
         <c:if test="${ empty userobj}">
            <c:redirect url="../login.jsp"></c:redirect>
        </c:if>
        <h3 class="text-center">All Orders </h3>
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">EMail</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Mode</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnector.getConnection());
                List<BookOrderDTO> blist = dao.getAllOrder();
                
                for(BookOrderDTO b :blist)
                {
                %>
                
                <tr>
                    <th scope="row"><%=b.getOrderId()%></th>
                    <td><%=b.getUserName()%></td>
                    <td><%=b.getEmail()%></td>
                    <td><%=b.getFullAddress()%></td>
                    <td><%=b.getPhone()%></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>

                </tr>
                <%}%>
            </tbody>
        </table>
        <div class="Footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
