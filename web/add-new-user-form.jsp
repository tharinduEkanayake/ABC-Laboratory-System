<%-- 
    Document   : add-new-user-form
    Created on : Mar 2, 2024, 6:05:41 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
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
        <title>Insert User</title>


        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Salsa&family=Yellowtail&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="content">
            <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
                <div class="row">
                    <div class="left col-6">
                        <h1 class="text-start">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger"><i class="fa-solid fa-right-from-bracket fa-sm" style="margin-right: 1rem;"></i> Log Out</button></a>
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
                    <h2 class="form-headding">Insert User</h2>
                </div>
                <hr />
            </div>


            <div class="container">
                <form action="User-Details" method="post" class="needs-validation">
                    <div class="mb-3 row">
                        <label for="inputID" class="col-1 col-form-label">User ID</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputID" value="${maxID + 1}" name="u_id" required readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-5">
                            <div class="row">
                                <label for="inputFirstName" class="col-4 col-form-label">First Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputFirstName" name="u_first_name" required />
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="inputLastName" class="col-3 col-form-label">Last Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputLastName" name="u_last_name" required />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputAddress" class="col-2 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAddress" name="u_address" required />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-5">
                            <div class="row">
                                <label for="inputGender" class="col-4 col-form-label">Gender</label>
                                <div class="col-sm-8">
                                    <select class="form-select" aria-label="Default select inputGender" name="u_gender">
                                        <option selected value="Male">male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="inputPhoneNo" class="col-3 col-form-label">Phone Number</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputPhoneNo" name="u_phone" maxlength="12" value="+94" required />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputEmail" class="col-2 col-form-label">Email</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="inputEmail" name="u_email" required />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-5">
                            <div class="row">
                                <label for="inputPhone" class="col-4 col-form-label">User Privileges</label>
                                <div class="col-sm-8">
                                    <select class="form-select" aria-label="Default select inputGender" name="u_privileges">
                                        <option selected value="FDESK">Front Desk User</option>
                                        <option value="TECH">Technician</option>
                                        <option value="ADMIN">Admin</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="inputRegisterDate" class="col-3 col-form-label">Register Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="inputRegisterDate" value="<%= formattedDate%>" name="u_registered_date" required readonly />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-2 col-form-label">Password</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="inputPassword" name="u_password" value="1234" required readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputRePassword" class="col-2 col-form-label">Confirm Password</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="inputRePassword" value="1234" required readonly />
                        </div>
                    </div>

                    <input type="hidden" value="ADD" name="command" />

                    <div class="row justify-content-end">
                        <div class="col-3">
                            <button type="submit" class="btn btn-success w-100">Enter Patient Details</button>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </form>
            </div>

        </div>



        <!--Footer css taglist-->
        <div class="footer container-fluid text-center py-4">
            <div class="copyright">
                &copy; 2024 ABC Laboratory | All rights reserved.
            </div>
            <div class="social-media mt-3">                
                    <i class="fa-brands fa-square-facebook fa-lg me-2"></i>
                    <i class="fa-brands fa-instagram fa-lg me-2"></i>
                    <i class="fa-brands fa-square-twitter fa-lg me-2"></i>
                    <i class="fa-brands fa-square-whatsapp fa-lg "></i>
            </div>
        </div>

        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
