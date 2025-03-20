<%-- 
    Document   : user_address
    Created on : 1 Feb, 2024, 9:32:30 PM
    Author     : nikhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address</title>
        <%@include file="All-Components/AllCss.jsp" %>
    </head>
    <body style="background-color:#ededed ">
        <%@include file="All-Components/navBar.jsp" %>
        
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3 mt-5 mb-2">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-primary">Add Address</h3>
                            <hr>
                            
                            <form action="">
                                
                                <div class="form-row">
                                   
                                    <div class="form-group col-md-12">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="Landmark">Landmark</label>
                                        <input type="text" class="form-control" id="Landmark" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="city">city</label>
                                        <input type="text" class="form-control" id="city" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="state">State</label>
                                        <input type="text" class="form-control" id="state" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="pincode">Pin Code</label>
                                        <input type="text" class="form-control" id="pincode" >
                                    </div>
                                </div>
                                
                                <div class="text-center">
                                    <button class="btn btn-warning text-white">
                                        Add Address
                                    </button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="All-Components/footer.jsp"%>
    </body>
</html>
