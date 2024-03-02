<%-- 
    Document   : patientDetails
    Created on : Mar 1, 2024, 12:02:35 PM
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
        <h2>Patient Details View</h2>
        
        <a href="Insert-Customer?command=UPDATE&type=${param['type']}">Add the new Customer</a>
        
        <table id="testReports" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Patient ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Birthday</th>
                    <th>Age</th>
                    <th>EMail</th>
                    <th>Phone Number</th>
                    <th>Register Date</th>
                    <th>Password Changed Date</th>
                    <th></th>
                        <c:if test="${param['type'] eq 'ADMIN'}">
                        <th></th>
                        </c:if>

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
                        <td>${item.p_age}</td>
                        <td>${item.p_email}</td>
                        <td>${item.p_phone}</td>
                        <td>${item.p_register_date}</td>
                        <td>${item.password_changed}</td>
                        <td><a href="Update-Customer?command=UPDATE&type=${param['type']}&id=${item.p_id}"><button>Update</button></a></td>
                        <c:if test="${param['type'] eq 'ADMIN'}">
                            <td><a href="Customer-Details?command=DEL&type=${param['type']}"><button>Delete</button></a></td>
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
