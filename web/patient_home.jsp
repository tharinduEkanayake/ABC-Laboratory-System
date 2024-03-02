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

        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Hello World!</h1>
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

                    <tr>
                        <c:if test="${items.t_isCancelled eq 'F'}">
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
                        </c:if>

                    </tr>




                </c:forEach>
            </tbody>
        </table>



        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#testReports');
        </script>

    </body>
</html>
