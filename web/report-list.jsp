<%-- 
    Document   : report-list
    Created on : Mar 9, 2024, 10:36:41 AM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer-alignment.css" rel="stylesheet" type="text/css"/>
        <link href="css/report.css" rel="stylesheet" type="text/css"/>
        
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
                        <span class="badge rounded-pill bg-dark">

                            <c:set var="typeaAD" value="ADMIN" />
                            <c:if test="${sessionScope.privilages eq typeaAD}">
                                Admin Login
                            </c:if>

                            <c:set var="typeaFD" value="FDESK" />
                            <c:if test="${sessionScope.privilages eq typeaFD}">
                                Front Desk Login
                            </c:if>

                        </span>
                    </div>
                </div>
            </div>

            <!-- Sub headding -->
            <div class="container-fluid subHeaddignContainer pt-3 mb-4">
                <div class="container">
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/Admin-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                    </div>
                </div>
            </div>

            <!-- Form Headding  -->
            <div class="form-headding">
                <hr />
                <div class="container">
                    <h2 class="form-headding text-center">Reports List</h2>
                </div>
                <hr />
            </div>


            <div class="container mt-4">
                <div class="row g-3">
                    <div class="col-3 rp-item">
                        <div class="">
                            <h5>Today Appointments</h5>
                        </div>
                        <div class="rp-content">
                            <div class="row">
                                <div class="col-6">
                                    <h1>2000</h1>
                                </div>
                                <div class="col-6">
                                    <h1 class="icon"><i class="fa-regular fa-calendar-check fa-xl"></i></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 rp-item">
                        <div class="">
                            <h5>Today Income</h5>
                        </div>
                        <div class="rp-content">
                            <div class="row">
                                <div class="col-6">
                                    <h1>45</h1>
                                </div>
                                <div class="col-6">
                                    <h1 class="icon"><i class="fa-solid fa-money-check-dollar fa-xl"></i></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 rp-item">
                        <div class="">
                            <h5>Customers</h5>
                        </div>
                        <div class="rp-content">
                            <div class="row">
                                <div class="col-6">
                                    <h1>45</h1>
                                </div>
                                <div class="col-6">
                                    <h1 class="icon"><i class="fa-solid fa-users fa-xl"></i></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 rp-item">
                        <div class="">
                            <h5>Tests</h5>
                        </div>
                        <div class="rp-content">
                            <div class="row">
                                <div class="col-6">
                                    <h1>100</h1>
                                </div>
                                <div class="col-6">
                                    <h1 class="icon"><i class="fa-solid fa-flask-vial fa-xl"></i></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="container mt-4">
                <div class="row g-3" style="">
                    <div class="col-6">
                        <h5 class="text-center">Daily Income</h5>
                        <div>
                            <canvas id="chartIncome"></canvas>
                        </div>
                    </div>
                    <div class="col-6">
                        <h5 class="text-center">Daily Test</h5>
                        <div class="text-center" style="position: relative; text-align: center; margin: 0 auto; height:20rem; ">
                            <canvas style="margin: 0 auto;" id="chartTest"></canvas>
                        </div>
                    </div>
                </div>

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
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

        <script>
            const ctx = document.getElementById('chartIncome');
            const c_test = document.getElementById('chartTest');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                            label: 'Income Amount',
                            data: [12, 19, 3, 5, 2, 3],
                            borderWidth: 3
                        }]
                },
                options: {
                    tension: .5,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            new Chart(c_test, {
                type: 'doughnut',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
                            borderWidth: 0
                        }]
                },
                options: {
                   
                }
            });
        </script>


    </body>
</html>
