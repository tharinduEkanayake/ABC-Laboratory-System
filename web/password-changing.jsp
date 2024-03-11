<%-- 
    Document   : password-changing
    Created on : Mar 10, 2024, 10:24:44 AM
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

                            <c:set var="typeaTD" value="TECH" />
                            <c:if test="${sessionScope.privilages eq typeaTD}">
                                Technician Desk Login
                            </c:if>

                            <c:set var="typeaPD" value="PATIENT" />
                            <c:if test="${sessionScope.privilages eq typeaPD}">
                                Patient Login
                            </c:if>

                        </span>
                    </div>
                </div>
            </div>

            <!-- Sub headding -->
            <div class="container-fluid subHeaddignContainer pt-3 mb-4">
                <div class="container">
                    <div class="d-inline subhead">
                        
                        <c:set var="AD" value="ADMIN" />
                            <c:if test="${sessionScope.privilages eq AD}">
                                <a href="/ABCLaboratorySystem/Admin-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                            </c:if>

                            <c:set var="FD" value="FDESK" />
                            <c:if test="${sessionScope.privilages eq FD}">
                                <a href="/ABCLaboratorySystem/FrontDesk-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                            </c:if>

                            <c:set var="TD" value="TECH" />
                            <c:if test="${sessionScope.privilages eq TD}">
                                <a href="/ABCLaboratorySystem/Technician-Home?command=LOAD"><h5 class="d-inline-block rounded-top">Home</h5></a>
                            </c:if>

                            <c:set var="PD" value="PATIENT" />
                            <c:if test="${sessionScope.privilages eq PD}">
                                <a href="/ABCLaboratorySystem/Test_report_details?command=LOAD"><h5 class="d-inline-block rounded-top">Home</h5></a>
                            </c:if>                      
                        
                    </div>
                </div>
            </div>

            <!-- Form Headding  -->
            <div class="form-headding">
                <hr />
                <div class="container">
                    <h2 class="form-headding">Change Password</h2>
                </div>
                <hr />
            </div>

            <!--Appointment Form-->
            <div class="container mt-3 mb-3 ">
                <form action="" method="" class="needs-validation">
                    <div class="mb-3 row">
                        <label for="inputID" class="col-2 col-form-label">ID</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputID" value="${l_id}" name="a_id" required readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputPass" class="col-2 col-form-label">New Password</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" id="inputPass" value="" name="new_pass" required  />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputRePass" class="col-2 col-form-label">Re Enter Password</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" id="inputRePass" value="" name="re_pass" required  />
                        </div>
                    </div>




                    <input type="text" class="" id="inputPrivi" value="${sessionScope.privilages}" name="p_privileges" hidden />


                    <div class="row justify-content-start">
                        <div class="col-5">
                            <button type="submit" id="btnsubmit" class="btn btn-success w-100">Change Password</button>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </form>
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


        <script>
            $(document).ready(function () {
                $("#btnsubmit").click(function (e) {
                    e.preventDefault();

                    let pass = $("#inputPass").val();
                    let repass = $("#inputRePass").val();

                    let privi = $("#inputPrivi").val();

//                    console.log(privi);

                    if (pass != "" && repass != "") {
                        if (pass == repass) {

                            $.ajax({
                                type: 'post',
                                url: 'Password',
                                data: {
                                    command: "UPDATE",
                                    pass: pass,
                                },
                                success: function (response) {
//                                console.log("Success");
                                    if (privi == "ADMIN") {
                                        window.location.href = "Admin-Home";
                                    } else if (privi == "TECH") {
                                        window.location.href = "Technician-Home?command=LOAD";
                                    } else if (privi == "FDESK") {
                                        window.location.href = "FrontDesk-Home";
                                    }
                                    else if (privi == "PATIENT"){
                                        window.location.href = "Test_report_details?command=LOAD";
                                    }


                                },
                                error: function (xhr, status, error) {
                                    // Handle error response
                                }
                            });

                        } else {
                            alert("Pleace Check Entered values....!!");
                        }
                    } else {
                        alert("Pleace Enter the Values");
                    }

                })
            })
        </script>
    </body>
</html>
