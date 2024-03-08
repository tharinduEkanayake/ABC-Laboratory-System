<%-- 
    Document   : technician-home
    Created on : Mar 1, 2024, 8:58:57 PM
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
                        <h1 class="text-star">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger">Log Out</button></a>
                        <span class="badge rounded-pill bg-dark">Technician Login</span>
                    </div>
                </div>
            </div>

            <h1 class="text-center">Enter Report Details</h1>
            <hr style="margin: 2rem 0;"/>

            <div class="container">
                <table id="appointmentDetails" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>Appointment ID</th>
                            <th>Report ID</th>
                            <th>Patient ID</th>
                            <th>Patient Name</th>
                            <th>Test Name</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${a_list}" >
                            <tr>

                                <td>${item.appointment_id}</td>
                                <td>${item.test_repo_id}</td>
                                <td>${item.patient_id}</td>
                                <td>${item.p_name}</td>
                                <td>${item.t_name}</td>

                                <td><a href="Add-Test-Report-Details?id=${item.test_repo_id}"><button>Add Test report Details</button></a></td>

                            </tr>
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
            new DataTable('#appointmentDetails');
        </script>

    </body>
</html>
