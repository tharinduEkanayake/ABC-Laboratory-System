<%-- 
    Document   : admin_home
    Created on : Feb 29, 2024, 9:28:03 PM
    Author     : Tharindu Konesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="text-light bg-dark text-center m-3 p-4 rounded-3">ABC Laboratory System</h1>
        </div>
        <div class="container text-center">
            <a href="/ABCLaboratorySystem/Customer-Details?command=LOAD&type=${param['type']}">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Customer Handlling</p>
                </div>
            </a>

            <a href="/ABCLaboratorySystem/User-Details?command=LOAD&type=${param['type']}">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Users Handlling</p>
                </div>
            </a>

            <a href="/ABCLaboratorySystem/Test-Details?command=LOAD&type=${param['type']}">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Tets Packages Handlling</p>
                </div>
            </a>

            <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD&type=${param['type']}">
                <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                    <p class="text-light">Appointment View</p>
                </div>
            </a>


            <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                Customer Handlling
            </div>



        </div>



        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
