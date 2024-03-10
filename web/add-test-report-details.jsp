<%-- 
    Document   : add-test-report-details
    Created on : Mar 7, 2024, 8:54:37 PM
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
                            Technician Login
                        </span>
                    </div>
                </div>
            </div>
            
            
            <!-- Sub headding -->
        <div class="container-fluid subHeaddignContainer pt-3 mb-4">
            <div class="container">
                <div class="d-inline subhead">
                    <a href="/ABCLaboratorySystem/Technician-Home?command=LOAD"><h5 class="d-inline-block rounded-top">Home</h5></a>
                </div>
            </div>
        </div>

        <!-- Form Headding  -->
        <div class="form-headding">
            <hr />
            <div class="container">
                <h2 class="form-headding">Add Report Details</h2>
            </div>
            <hr />
        </div>
        
        <div class="container">
            <form action="Add-Test-Report-Details" method="post" class="needs-validation">
                <div class="mb-3 row">
                    <label for="inputID" class="col-1 col-form-label">Report ID</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="inputID" value="${tr_id}" name="rp_id" required readonly />
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-7">
                        <div class="row">
                            <label for="inputTime" class="col-3 col-form-label">Test Time</label>
                            <div class="col-sm-7 col-md-8">
                                <input type="time" class="form-control" id="inputTime" name="t_time" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-6"></div>
                    
                </div>

                

                <div class="mb-3 row">
                    <div class="col-7">
                        <div class="row">
                            <label for="inputGender" class="col-3 col-form-label">Test Report Details</label>
                            <div class="col-sm-8 col-md-8">
                                <textarea class="form-control" name="r_data" required></textarea>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>

                <input type="hidden" value="ADDTR" name="command" />

                <div class="row justify-content-end">
                    <div class="col-3">
                        <button type="submit" class="btn btn-success w-100">Enter Test Report Details</button>
                    </div>
                    <div class="col-1"></div>
                </div>

            </form>
        </div>

        
            
        </div>
        
        
        
        
        
        
   
        
        <!--Footer css taglist-->
        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>

        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
