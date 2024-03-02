<%-- 
    Document   : usersDetails
    Created on : Mar 1, 2024, 4:16:52 PM
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
        <h1>Users Details</h1>
        
        <a href="Insert-User?command=UPDATE&type=${param['type']}">Add the new User</a>
        
        <table id="usersData" class="display" style="width:100%">
            <thead>
                <tr>
                    <td>User ID</td>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Login Type</th>
                    <th>Registered Date</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${usersList}">
                <c:if test="${item.is_deleted eq 'F'}">
                    <tr>
                        <td>${item.u_id}</td>
                        <td>${item.u_first_name} ${item.u_last_name}</td>
                        <td>${item.u_address}</td>
                        <td>${item.u_gender}</td>
                        <td>${item.u_email}</td>
                        <td>${item.u_phone}</td>
                        <td>${item.u_privileges}</td>
                        <td>${item.u_registered_date}</td>

                        <td><a href="Update-Users?command=UPDATE&type=${param['type']}&id=${item.u_id}"><button>Update</button></td>
                        <td><a href="User-Details?command=DEL&type=${param['type']}"><button>Delete</button></a></td>
                    </tr>
                </c:if>

            </c:forEach>
        </tbody>
    </table>


    <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="data_tables/datatables.min.js" type="text/javascript"></script>
    
    <script>
        new DataTable('#usersData');
    </script>
</body>
</html>
