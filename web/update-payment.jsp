<%-- 
    Document   : update-payment
    Created on : Mar 8, 2024, 1:39:44 PM
    Author     : Tharindu Konesh
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--set the current Date-->
<%
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                    <h2 class="form-headding">Add Payments</h2>
                </div>
                <hr />
            </div>


            <div class="container">
                <form action="Payments" method="post" class="needs-validation">
                    <div class="mb-3 row">
                        <label for="inputID" class="col col-md-2 col-form-label">Test Report ID</label>
                        <div class="col col-md-3">
                            <input type="text" class="form-control" id="inputID" value="${max + 1}" name="p_id" readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputID" class="col col-md-2 col-form-label">Appointment ID</label>
                        <div class="col col-md-3">
                            <input type="text" class="form-control" id="inputID" value="${PaymentData.a_id}" name="a_id" readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputName" class="col-md-2 col-form-label">Total Value</label>
                        <div class="col-md-3">
                            <input type="text" class="form-control" id="inputName" name="total" value="${PaymentData.charges}" readonly/>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-5">
                            <div class="row">
                                <label for="inputType" class="col-4 col-form-label">Payment Type</label>
                                <div class="col-sm-8">
                                    <select class="form-select" aria-label="Default select inputType" name="p_type">
                                        <option selected value="Cash">Cash</option>
                                        <option value="Card">Card</option>
                                        <option value="Online">Online</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="inputDate" class="col-3 col-form-label">Payment Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="inputDate" value="<%= formattedDate%>" name="p_date" readonly />
                                </div>
                            </div>
                        </div>
                    </div>



                    <input type="hidden" value="UPDATEONE" name="command" />

                    <div class="row justify-content-end">
                        <div class="col-3">
                            <button type="submit" class="btn btn-success w-100">Enter Payment Details</button>
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
