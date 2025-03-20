<%-- 
    Document   : old_book
    Created on : 2 Feb, 2024, 4:58:14 PM
    Author     : nikhi
--%>

<%@page import="dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookDtlsDTO"%>
<%@page import="DB.DBConnector"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User : Old Book</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body>
        <%@include file="All-Components/navBar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center"><p class="text-success text-center font-weight-bold">${succMsg}</p></div>
            <c:remove var="succMsg" scope="session"></c:remove>
        </c:if>
        <c:if test="${not empty failedMsh}">
        <div class="alert alert-danger text-center"> <p class="text-danger text-center font-weight-bold">${failedMsg}</p></div>
            <c:remove var="failedMsg" scope="session"></c:remove>
        </c:if>
        <div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-dark text-white">
                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserDTO user = (UserDTO) session.getAttribute("userobj");
                        BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
                        List<BookDtlsDTO> list = dao.getBookByOld(user.getEmail(), "OldBook");
                        for (BookDtlsDTO b : list) {
%>
                    <tr>
                        <th scope="row"><%=b.getBookName()%></th>

<!--<td><%=b.getBookId()%></td>-->
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getBookCategory()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><a href="DeleteOldBookServlet?bId=<%=b.getBookId()%>&&email=<%=user.getEmail()%>" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
