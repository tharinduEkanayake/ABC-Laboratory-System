<%-- 
    Document   : testPackages
    Created on : Mar 1, 2024, 4:56:40 PM
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
        <h1>Test Packeges</h1>

        <c:if test="${param['type'] eq 'ADMIN'}">
            <a href="Insert-Tets-Package?command=UPDATE&type=${param['type']}">Add the new User</a>
        </c:if>
            
        <table id="testData" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Test ID</th>
                    <th>Test Name</th>
                    <th>Charging Value</th>
                    <th>Reference Level</th>

                    <c:if test="${param['type'] eq 'ADMIN'}">
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

                            <c:if test="${param['type'] eq 'ADMIN'}">
                                <td><a href="Update-Test-Packages?command=UPDATE&type=${param['type']}&id=${item.t_id}"><button>Update</button></td>
                                <td><a href="User-Details?command=DEL&type=${param['type']}"><button>Delete</button></a></td>
                            </c:if>
                        </tr>
                    </c:if>

                </c:forEach>
            </tbody>
        </table>

        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="data_tables/datatables.min.js" type="text/javascript"></script>

        <script>
            new DataTable('#testData');
        </script>
    </body>
</html>
