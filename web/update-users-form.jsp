<%-- 
    Document   : update-users-form
    Created on : Mar 2, 2024, 6:37:24 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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

        <!-- Sub heading -->
        <div class="container-fluid subHeaddignContainer pt-3 mb-4">
            <div class="container">
                <div class="d-inline subhead">
                    <a href="/ABCLaboratorySystem/Admin-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                </div>
            </div>
        </div>

        <!-- Form Heading  -->
        <div class="form-headding">
            <hr />
            <div class="container">
                <h2 class="form-headding">Update User</h2>
            </div>
            <hr />
        </div>


        <div class="container">
            <form action="" method="post" class="needs-validation">
                <div class="mb-3 row">
                    <label for="inputID" class="col-1 col-form-label">User ID</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputID" value="${User.u_id}" name="u_id" required readonly />
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-5">
                        <div class="row">
                            <label for="inputFirstName" class="col-4 col-form-label">First Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputFirstName" name="u_first_name" value="${User.u_first_name}" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <label for="inputLastName" class="col-3 col-form-label">Last Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputLastName" name="u_last_name" value="${User.u_last_name}" required />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputAddress" class="col-2 col-form-label">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputAddress" name="u_address" value="${User.u_address}" required />
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-5">
                        <div class="row">
                            <label for="inputGender" class="col-4 col-form-label" >Gender</label>
                            <div class="col-sm-8">
                                <input type="text" name="u_gender" class="form-control" value="${User.u_gender}" readonly/>
<!--                                <select class="form-select" aria-label="Default select inputGender" name="u_gender">
                                    <option selected value="Male">male</option>
                                    <option value="Female">Female</option>
                                </select>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <label for="inputPhoneNo" class="col-3 col-form-label">Phone Number</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputPhoneNo" name="u_phone" maxlength="12" value="${User.u_phone}" required />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="inputEmail" class="col-2 col-form-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="inputEmail" name="u_email" value="${User.u_email}" required readonly/>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-5">
                        <div class="row">
                            <label for="inputPhone" class="col-4 col-form-label">User Privileges</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="u_privileges" value="TECH" value="${User.u_privileges}" readonly/>
<!--                                <select class="form-select" aria-label="Default select inputGender" name="u_privileges">
                                    <option selected value="FDESK">Front Desk User</option>
                                    <option value="TECH">Technician</option>
                                    <option value="ADMIN">Admin</option>
                                </select>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <label for="inputRegisterDate" class="col-3 col-form-label">Register Date</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="inputRegisterDate" value="${User.u_registered_date}" name="u_registered_date" required readonly />
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" value="ADD" name="command" />

                <div class="row justify-content-end">
                    <div class="col-3">
                        <button type="submit" class="btn btn-success w-100">Update User Details</button>
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
