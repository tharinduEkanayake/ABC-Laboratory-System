<%-- 
    Document   : testPackages
    Created on : Mar 1, 2024, 4:56:40 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Packages</title>


        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
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
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/Customer-Details?command=LOAD"><h5 class="d-inline-block rounded-top ">Customer</h5></a>
                    </div>


                    <c:if test="${sessionScope.privilages eq typeaAD}">
                        <div class="d-inline subhead">
                            <a href="/ABCLaboratorySystem/User-Details?command=LOAD"><h5 class="d-inline-block rounded-top">Users</h5></a>
                        </div>
                    </c:if>

                    <div class="d-inline subhead">
                        <a href=""><h5 class="d-inline-block rounded-top online">Test Packages</h5></a>
                    </div>
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD"><h5 class="d-inline-block rounded-top">Appointments</h5></a>
                    </div>
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/Payments?command=LOAD"><h5 class="d-inline-block rounded-top">Payments</h5></a>
                    </div>
                </div>
            </div>

            <!-- Form Heading  -->
            <div class="form-headding ">
                <hr />
                <div class="container">
                    <h2 class="form-headding ">Test Packages List</h2>
                </div>
                <hr />
            </div>

            <!-- Add new item link button -->
            <c:set var="typeaAD" value="ADMIN" />
            <c:if test="${sessionScope.privilages eq typeaAD}">
                <div class="container btn-insert text-right">
                    <a href="Insert-Tets-Package"><button class="btn btn-success">Add New Test Package</button></a>
                </div>
            </c:if>


            <!-- View Data Table -->
            <div class="container">
                <table id="testData" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>Test ID</th>
                            <th>Test Name</th>
                            <th>Charging Value</th>
                            <th>Reference Level</th>

                            <c:if test="${sessionScope.privilages eq typeaAD}">
                                <th></th>
                                <th></th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${testDetailsList}">
                            <c:if test="${item.is_deleted eq 'F'}">
                                <tr>
                                    <td>${item.t_id}</td>
                                    <td>${item.t_name}</td>
                                    <td>${item.charges}</td>
                                    <td>${item.references_level}</td>

                                    <c:if test="${sessionScope.privilages eq typeaAD}">
                                        <td><a href="Update-Test-Packages?id=${item.t_id}"><button>Update</button></td>
                                        <td><button onclick="confirmAction(${item.t_id})">Delete</button></td>
                                    </c:if>
                                </tr>
                            </c:if>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        


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
        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#testData');
        </script>
        
        <script>
            function confirmAction(id) {
                var result = confirm("Are you sure you want to perform this action?");
                if (result) {
                    
                    window.location.href = "Test-Details?command=DEL&id="+ id;
                    
                } 
            }
        </script>
    </body>
</html>
