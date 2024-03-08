<%-- 
    Document   : add-new-test-package
    Created on : Mar 2, 2024, 6:09:03 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Package</title>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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

            <!-- Sub heading -->
            <div class="container-fluid subHeaddignContainer pt-3 mb-4">
                <div class="container">
                    <div class="d-inline subhead">
                        <a href="/ABCLaboratorySystem/Admin-Home"><h5 class="d-inline-block rounded-top">Home</h5></a>
                    </div>
                </div>
            </div>

            <!-- Form Heading  -->
            <div class="form-headding">
                <hr />
                <div class="container">
                    <h2 class="form-headding">Insert Test Package</h2>
                </div>
                <hr />
            </div>


            <div class="container">
                <form action="Test-Details" method="post" class="needs-validation">
                    <div class="mb-3 row">
                        <label for="inputID" class="col-2 col-form-label">Test ID</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputID" value="${maxID + 1}" name="t_id" required readonly />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-6">
                            <div class="row">
                                <label for="inputTestName" class="col-4 col-form-label">Test Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputTestName" name="t_name" required />
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="inputCharges" class="col-4 col-form-label">Charging Amount</label>
                                <div class="col-sm-6">
                                    <input type="number" class="form-control" id="inputCharges" name="charges" required />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="inputReferenceLevel" class="col-2 col-form-label">Reference Level</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="inputReferenceLevel" rows="3" name="references_level" required></textarea>
                        </div>
                    </div>

                    <input type="hidden" value="ADD" name="command" />

                    <div class="row justify-content-end">
                        <div class="col-3">
                            <button type="submit" class="btn btn-success w-100">Enter Patient Details</button>
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
