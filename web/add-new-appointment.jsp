<%-- 
    Document   : add-new-appointment
    Created on : Mar 2, 2024, 8:00:14 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Appointment</title>

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
                <h2 class="form-headding">Insert Appointment</h2>
            </div>
            <hr />
        </div>

        <!--Footer css taglist-->
        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>


        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
