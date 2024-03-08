<%-- 
    Document   : patientDetails
    Created on : Mar 1, 2024, 12:02:35 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="content">
            <!--Header tag-->
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
                <div class="d-inline subhead">
                    <a href=""><h5 class="d-inline-block rounded-top online">Customer</h5></a>
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
                    <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD"><h5 class="d-inline-block rounded-top">Appointments</h5></a>
                </div>
            </div>
        </div>

        <!-- Form Heading  -->
        <div class="form-headding ">
            <hr />
            <div class="container">
                <h2 class="form-headding ">Patient Details List</h2>
            </div>
            <hr />
        </div>

        <!--Add new Customer link button-->
        <div class="container btn-insert text-right">
            <a href="Insert-Customer"><button class="btn btn-success">Add New Customer</button></a>
        </div>

        <!-- View Data Table -->
        <div class="container">
            <table id="testReports" class="display" >
                <thead>
                    <tr>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Birthday</th>
                        <!--<th>Age</th>-->
                        <th>EMail</th>
                        <th>Phone Number</th>
                        <!--<th>Register Date</th>-->
                        <!--<th>Password Changed Date</th>-->
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${patientDtailsList}">
                        <tr>
                            <td>${item.p_id}</td>
                            <td>${item.p_name}</td>
                            <td>${item.p_gender}</td>
                            <td>${item.p_address}</td>
                            <td>${item.p_birthday}</td>

                            <td>${item.p_email}</td>
                            <td>${item.p_phone}</td>

                            <td><a href="Update-Customer?id=${item.p_id}"><button>Update</button></a></td>

                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            
        </div>
        






        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>

        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#testReports');
        </script>
        
        <script>
//            function confirmAction(id) {
//                var result = confirm("Are you sure you want to perform this action?");
//                if (result) {
//                    
//                    window.location.href = "Customer-Details?command=DEL&id="+ id;
//                    
//                } 
//            }
        </script>
    </body>
</html>
