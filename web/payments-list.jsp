<%-- 
    Document   : payments-list
    Created on : Mar 8, 2024, 12:16:51 PM
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

        <link href="bootstrap-5.0.2-dist/css/bootstrap.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="content">
            <!--Header tag-->
            <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
                <div class="row">
                    <div class="left col-6">
                        <h1 class="">ABC Laboratory System</h1>
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
                        <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD"><h5 class="d-inline-block rounded-top">Appointments</h5></a>
                    </div>

                    <div class="d-inline subhead">
                        <a href=""><h5 class="d-inline-block rounded-top online">Payments</h5></a>
                    </div>
                </div>
            </div>

            <!-- Form Heading  -->
            <div class="form-headding mb-4">
                <hr />
                <div class="container">
                    <h2 class="form-headding ">Payment List</h2>
                </div>
                <hr />
            </div>


            <!-- View Data Table -->
            <div class="container">
                <table id="testReports" class="display" >
                    <thead>
                        <tr>
                            <td>Appointment ID</td>
                            <td>Test Report ID</td>
                            <td>Test Name</td>
                            <td>Amount</td>
                            <!--<td></td>-->
                            <td></td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${paymentList}">
                            <tr>
                                <td>${item.a_id}</td>
                                <td>${item.test_report_id}</td>
                                <td>${item.t_name}</td>
                                <td>${item.charges}</td>
                                <td><a href="/ABCLaboratorySystem/Payments?command=UPDATE&id=${item.test_report_id}"><button>Make Payment</button></a></td>

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
    </body>
</html>
