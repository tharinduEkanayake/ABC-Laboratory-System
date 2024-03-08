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
        <title>Users Details</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
                <div class="row">
                    <div class="left col-6">
                        <h1 class="text-start">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger">Log Out</button></a>
                        <span class="badge rounded-pill bg-dark">Admin Login</span>

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
                    <div class="d-inline subhead">
                        <a href=""><h5 class="d-inline-block rounded-top online">Users</h5></a>
                    </div>
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
                    <h2 class="form-headding ">Users Details List</h2>
                </div>
                <hr />
            </div>

            <!-- Add new item link button -->
            <div class="container btn-insert text-right">
                <a href="Insert-User"><button class="btn btn-success">Add new User</button></a>
            </div>


            <table id="usersData" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
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

                                <td><a href="Update-Users?id=${item.u_id}"><button>Update</button></a></td>
                                <td><button onclick="confirmAction(${item.u_id})">Delete</button></td>
                            </tr>
                        </c:if>

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
            new DataTable('#usersData');
        </script>
        
        <script>
            function confirmAction(id) {
                var result = confirm("Are you sure you want to perform this action?");
                if (result) {
                    
                    window.location.href = "User-Details?command=DEL&id="+ id;
                    
                } 
            }
        </script>
    </body>
</html>
