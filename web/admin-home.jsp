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
        <title>Admin Home</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
        <link href="css/user-home.css" rel="stylesheet" type="text/css"/>

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
                        <h1 class="text-start">ABC Laboratory System</h1>
                    </div>

                    <div class="right col-6 align-self-center">
                        <a href="/ABCLaboratorySystem/Log-Out"><button class="btn btn-danger"><i class="fa-solid fa-right-from-bracket fa-sm" style="margin-right: 1rem;"></i> Log Out</button></a>
                        <span class="badge rounded-pill bg-dark">Admin Login</span>

                    </div>
                </div>
            </div>




            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/Customer-Details?command=LOAD" class="">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-users fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Customer Handling</p>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/User-Details?command=LOAD">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-user-tie fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Users Handling</p>
                                </div>
                            </div>

                        </a>
                    </div>

                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/Test-Details?command=LOAD">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-flask-vial fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Tets Packages</p>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/Appointment-List?command=LOAD">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-calendar-check fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Appointments</p>
                                </div>
                            </div>                            
                        </a>
                    </div>

                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/Payments?command=LOAD">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-money-bill-1 fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Payments</p>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-3">
                        <a href="/ABCLaboratorySystem/Reports?command=LOAD">
                            <div class="select-item me-3 mb-3" >
                                <h1 class="select-item-icon">
                                    <i class="fa-solid fa-file-lines fa-xl"></i>
                                </h1>
                                <div class="select-item-head">
                                    <p>Reports List</p>
                                </div>
                            </div>
                        </a>
                    </div>




                </div>












                <!--            <div class="patient-list bg-dark d-inline-block me-3 mb-3" style="width: 250px; height: 250px;">
                                Customer Handlling
                            </div>-->

            </div>


        </div>






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
    </body>
</html>
