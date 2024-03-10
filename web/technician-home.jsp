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
        <title>Home</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="data_tables/datatables.min.css" rel="stylesheet" type="text/css"/>
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
                        <h1 class="text-star">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger"> <i class="fa-solid fa-right-from-bracket fa-sm" style="margin-right: 1rem;"></i> Log Out</button></a>
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
            new DataTable('#appointmentDetails');
        </script>

    </body>
</html>
