<%-- 
    Document   : appointmentDetails
    Created on : Mar 1, 2024, 7:55:55 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Details</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
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
                <div class="d-inline subhead">
                    <a href="/ABCLaboratorySystem/Customer-Details?command=LOAD"><h5 class="d-inline-block rounded-top ">Customer</h5></a>
                </div>

                
                <c:if test="${sessionScope.privilages eq typeaAD}">
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/User-Details?command=LOAD"><h5 class="d-inline-block rounded-top">Users</h5></a>
                    </div>
                </c:if>

                <div class="d-inline subhead">
                    <a href="/ABCLaboratorySystem/Test-Details?command=LOAD"><h5 class="d-inline-block rounded-top">Test Packages</h5></a>
                </div>
                <div class="d-inline subhead">
                    <a href=""><h5 class="d-inline-block rounded-top online">Appointments</h5></a>
                </div>
            </div>
        </div>

        <!-- Form Heading  -->
        <div class="form-headding ">
            <hr />
            <div class="container">
                <h2 class="form-headding ">Appointment List</h2>
            </div>
            <hr />
        </div>

        <!-- Add new item link button -->
        <div class="container btn-insert text-right">
            <a href="Insert-Appointment"><button class="btn btn-success">Add New Appointment</button></a>
        </div>

        <!-- View Data Table -->
        <div class="container">
            <table id="AppointmentData" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>Appointment ID</th>
                        <th>Appointment Date</th>
                        <th>Register Date</th>
                        <th>Appointment Status</th>
                        <th>Patient ID</th>

                        <th></th>
                            <c:if test="${sessionScope.privilages eq typeaAD}">
                            <th></th>
                            </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="items" items="${Appointments}" >
                        <tr>
                            <c:if test="${items.is_cencelled eq 'F'}">
                                <td>${items.a_id}</td>
                                <td>${items.a_date}</td>
                                <td>${items.register_date}</td>
                                <td>${items.a_status}</td>
                                <td>${items.patient_id}</td>

                                <td><a href="Appointment-List?command=UPDATE&id=${items.a_id}"><button>View Test</button></a></td>
                                <c:if test="${sessionScope.privilages eq typeaAD}">
                                    <td><a href="Appointment-List?command=DEL&id=${items.a_id}"><button>Delete</button></a></td>
                                </c:if>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>


        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>


        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#AppointmentData');
        </script>
    </body>
</html>
