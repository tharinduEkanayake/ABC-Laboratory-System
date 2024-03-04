<%-- 
    Document   : frontDesk-home
    Created on : Mar 1, 2024, 9:45:13 PM
    Author     : Tharindu Konesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid main-headding pt-2 pb-4 pt-4 mb-4">
            <div class="row">
                <div class="left col-6">
                    <h1 class="text-start">ABC Laboratory System</h1>
                </div>

                <div class="right col-6 align-self-center">
                    <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger">Log Out</button></a>
                    <span class="badge rounded-pill bg-dark">Front Desk Login</span>
                </div>
            </div>
        </div>

        <!--<h1>FrontDesk Home</h1>-->
        <!--        <div class="container-fluid bg-dark text-center  rounded-3 py-4">
                    <h1 class="text-light ">ABC Laboratory System</h1>
                    <h3 class="text-light mt-3">Frondesk View</h3>
                </div>-->

        <div class="container text-center mt-4">
            <a href="/ABCLaboratorySystem/Customer-Details?command=LOAD">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Customer Handlling</p>
                </div>
            </a>

            <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Appointment View</p>
                </div>
            </a>

            <a href="/ABCLaboratorySystem/Test-Details?command=LOAD">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Tets Packages Handlling</p>
                </div>
            </a>

        </div>

        <!--Footer div-->
        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>

        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
