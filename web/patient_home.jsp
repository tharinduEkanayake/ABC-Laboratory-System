<%-- 
    Document   : patient_home
    Created on : Feb 29, 2024, 4:01:14 PM
    Author     : Tharindu Konesh
--%>
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

            <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
                <div class="row">
                    <div class="left col-6">
                        <h1 class="">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger">Log Out</button></a>
                        <span class="badge rounded-pill bg-dark">Patient Login</span>
                    </div>
                </div>
            </div>

            <h1 class="text-center">View Appointment List</h1>
            <hr style="margin: 2rem 0;"/>
            <div class="container">
                
                <table id="testReports" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>Test ID </th>
                            <th>Test Name</th>
                            <th>Test Date</th>
                            <th>Test Time</th>
                            <th>Test Report Data</th>
                            <th>Report Status</th>
                            <th>Reference Level</th>

                            <th>Charges</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="items" items="${patientReportDetais}" >
                            <c:if test="${items.t_isCancelled eq 'F'}">
                                <tr>

                                    <td>${items.report_id}</td>
                                    <td>${items.test_name}</td>
                                    <td>${items.a_date}</td>
                                    <td>${items.test_time}</td>
                                    <td>${items.report_data}</td>

                                    <c:if test="${items.report_status eq 'COM'}">
                                        <td>Complete</td>
                                    </c:if>

                                    <c:if test="${items.report_status ne 'COM'}">
                                        <td>${items.report_status}</td>
                                    </c:if>

                                    <td>${items.ref_level}</td>

                                    <td>${items.charges}</td>

                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>


        <!--Footer css taglist-->
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
