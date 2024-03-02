<%-- 
    Document   : appointmentDetails
    Created on : Mar 1, 2024, 7:55:55 PM
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
        <h1>Appointment Details</h1>

        <table id="AppointmentData" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Appointment Date</th>
                    <th>Register Date</th>
                    <th>Appointment Status</th>
                    <th>Patient ID</th>

                    <th></th>
                        <c:if test="${param['type'] eq 'ADMIN'}">
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

                            <td><a href="Appointment-List?command=UPDATE&type=${param['type']}"><button>View Test</button></a></td>
                            <c:if test="${param['type'] eq 'ADMIN'}">
                                <td><a href="Appointment-List?command=DEL&type=${param['type']}"><button>Delete</button></a></td>
                            </c:if>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#AppointmentData');
        </script>
    </body>
</html>
