<%-- 
    Document   : add-new-customer-form
    Created on : Mar 2, 2024, 6:01:39 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!--set the current Date-->
<%
  Date currentDate = new Date();
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String formattedDate = dateFormat.format(currentDate);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Customer</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
            <div class="row">
                <div class="left col-6">
                    <h1 class="text-start">ABC Laboratory System</h1>
                </div>

                <div class="right col-6 align-self-center">
                    <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger">Log Out</button></a>
                    <span class="badge rounded-pill bg-dark">

                        <c:set var="typeaAD" value="ADMIN" />
                        <c:if test="${sessionScope.privilages eq typeaAD}">
                            Admin Login
                        </c:if>

                        <c:set var="typeaFD" value="FDESK" />
                        <c:if test="${sessionScope.privilages eq typeaFD}">
                            Front Desk Login
                        </c:if>

                    </span>
                </div>
            </div>
        </div>

        <!-- Sub headding -->
        <div class="container-fluid subHeaddignContainer pt-3 mb-4">
            <div class="container">
                <div class="d-inline subhead">
                    <a href="/ABCLaboratorySystem/Admin-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                </div>
            </div>
        </div>

        <!-- Form Headding  -->
        <div class="form-headding">
            <hr />
            <div class="container">
                <h2 class="form-headding">Add Customer</h2>
            </div>
            <hr />
        </div>


        <div class="container">
            <form action="Customer-Details" method="post" class="needs-validation">
                <div class="mb-3 row">
                    <label for="inputID" class="col-1 col-form-label">Patient ID</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputID" value="${MaxID + 1}" name="p_id" required readonly />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputName" class="col-2 col-form-label">Patient Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputName" name="p_name" required />
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputAddress" class="col-2 col-form-label">Patient Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputAddress" name="p_address" required />
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-5">
                        <div class="row">
                            <label for="inputGender" class="col-4 col-form-label">Patient Gender</label>
                            <div class="col-sm-8">
                                <select class="form-select" aria-label="Default select inputGender" name="p_gender">
                                    <option selected value="Male">male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <label for="inputBirthday" class="col-3 col-form-label">Patient Birthday</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="inputBirthday" min="1940-01-01" max="2024-02-03" name="p_birthday" required />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputEmail" class="col-2 col-form-label">Patient Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="inputEmail" name="p_email" required />
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-5">
                        <div class="row">
                            <label for="inputPhone" class="col-4 col-form-label">Phone Number</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputPhone" maxlength="12" name="p_phone" value="+94" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <label for="inputRegisterDate" class="col-3 col-form-label">Register Date</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="inputRegisterDate" value="<%= formattedDate %>" name="p_register_date" required readonly />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputPassword" class="col-2 col-form-label">Password</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="inputPassword" name="p_password" value="1234" required readonly/>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputRePassword" class="col-2 col-form-label">Confirm Password</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="inputRePassword" value="1234" required readonly/>
                    </div>
                </div>

                <input type="hidden" value="PATIENT" name="p_privileges">
                <input type="hidden" value="ADD" name="command" />

                <div class="row justify-content-end">
                    <div class="col-3">
                        <button type="submit" class="btn btn-success w-100">Enter Patient Details</button>
                    </div>
                    <div class="col-1"></div>
                </div>

            </form>
        </div>


        <!--Footer css taglist-->
        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>

        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
