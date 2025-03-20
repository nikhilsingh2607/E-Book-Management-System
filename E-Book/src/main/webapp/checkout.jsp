<%-- 
    Document   : cart
    Created on : 31 Jan, 2024, 9:15:20 PM
    Author     : nikhil
--%>

<%@page import="dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page import="DAO.CartDAOImpl"%>
<%@page import="DB.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <%@include file="All-Components/AllCss.jsp"%>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp"%>
        <c:if test="${ empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center font-weight-bold" role="alert">${succMsg}</div>
            <c:remove  var="succMsg" scope="session"></c:remove>
        </c:if>
            <c:if test="${not empty failedMsg}">
                <div class="alert alert-danger text-center font-weight-bold" role="alert">${failedMsg}</div>
                <c:remove var="failedMsg" scope="session"></c:remove>
            </c:if>
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6">
                    <div class="card bg-white">
                        <div class="card-body ">
                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        UserDTO user = (UserDTO) session.getAttribute("userobj");

                                        CartDAOImpl dao = new CartDAOImpl(DBConnector.getConnection());
                                        List<CartDTO> list = dao.getBookByUser(user.getId());
                                        
                                        Double totalPrice = 0.00;
                                         for (CartDTO c : list) { 
                                         totalPrice = c.getTotalPrice(); %>
                                    <tr>
                                        <th scope="row"><%=c.getBookName()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td>
                                            <a href="RemoveBookCartServlet?bId=<%=c.getBookId()%>&&uId=<%=c.getUserId()%>&&cId=<%=c.getCartId()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <% }
                                    %>
                                    <tr>
                                        <td>Total Price </td>
                                        <td></td>
                                        <td></td>
                                        <td class=" font-weight-bold"><%=totalPrice%></td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details For order</h3>
                            <form action="OrderServlet" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <input type="hidden" name="id" value="${userobj.id}">
                                        <label for="Name">Name</label>
                                        <input type="text" class="form-control" name="name" id="Name" value="<%=user.getName()%>" readonly="readonly">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="Email">Email</label>
                                        <input type="email" class="form-control" name="email" id="Email" value="<%=user.getEmail()%>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="phone">Phone No.</label>
                                        <input type="number" class="form-control" name="phone" id="phone" value="<%=user.getPhone()%>">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" name="address" id="address" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="Landmark">Landmark</label>
                                        <input type="text" class="form-control" name="landmark" id="Landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="city">City</label>
                                        <input type="text" class="form-control" name="city" id="city" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="state">State</label>
                                        <input type="text" class="form-control" name="state" id="state" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="pincode">Pin Code</label>
                                        <input type="text" class="form-control" name="pincode" id="pincode" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="payment" >Payment Mode</label>
                                    <select class="form-control" name="payment">
                                        <option value="noselect">--Select--</option>
                                        <option value="COD">Cash On Delivery</option>
                                    </select>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning">Order Now</button> 
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
