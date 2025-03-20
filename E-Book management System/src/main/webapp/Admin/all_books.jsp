<%-- 
    Document   : all_books
    Created on : 19 Jan, 2024, 6:31:39 PM
    Author     : nikhil
--%>

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
        <title>Admin: All Books</title>
        <%@include file="AllCss.jsp"%>
    </head>
    <body>
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
        
        <hr>
        <h3 class="text-center">All Books List</h3>
        <hr>
        <c:if test="${not empty succMsg}">
            <p class="text-center text-success">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty failedMSg}">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        <table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
      
      <%
          BookDAOImpl dao = new BookDAOImpl(DBConnector.getConnection());
          List<BookDtlsDTO> list=dao.getAllBooks();
          for(BookDtlsDTO b :list)
          {%>
          <tr>
        <td ><%=b.getBookId()%></td>
        <td><img src="../book-img/<%=b.getPhotoName()%>" style="width:50px; heigth:50px;"></td>
        <td><%=b.getBookName()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getBookCategory()%></td>
        <td><%=b.getStatus()%></td>
      <td>
          <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
          <a href="../BooksDeleteServlet?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
      </td>
      
    </tr>
          <%
          }
          %>
      
  </tbody>
</table>
        <div class="Footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
