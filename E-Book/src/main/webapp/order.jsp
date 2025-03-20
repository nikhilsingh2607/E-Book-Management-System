<%-- 
    Document   : order
    Created on : 1 Feb, 2024, 10:28:44 PM
    Author     : nikhi
--%>

<%@page import="dto.BookOrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookOrderDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp" %>
        <c:if test="${ empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <div class="container p-1">
            <h3 class="text-center text-primary">Your Orders</h3>
            <table class="table table-striped mt-3">
  <thead class="bg-dark text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
      <%UserDTO user = (UserDTO)session.getAttribute("userobj");
      BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnector.getConnection());
      List<BookOrderDTO> blist = dao.getBook(user.getEmail());
      for(BookOrderDTO b : blist)
      {
      %>
    <tr>
        <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
    </tr>
    <%}%>
  </tbody>
</table>
        </div>
        <%--<%@include file="All-Components/footer.jsp"%>--%>
    </body>
</html>
