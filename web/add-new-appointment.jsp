<%-- 
    Document   : add-new-appointment
    Created on : Mar 2, 2024, 8:00:14 PM
    Author     : Tharindu Konesh
--%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!--set the current Date-->
<%
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>

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
                <h2 class="form-headding">Add New Appointment</h2>
            </div>
            <hr />
        </div>

        <!--Appointment Form-->
        <div class="container mt-3 mb-3">
            <!--<form action="" method="" class="needs-validation">-->
            <div class="mb-3 row">
                <label for="inputID" class="col-2 col-form-label">Appointment ID</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputID" value="${maxID + 1}" name="a_id" required readonly />
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-5">
                    <div class="row">
                        <label for="inputADate" class="col-4 col-form-label">Appointment Date</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="inputADate" name="a_date" min="<%= formattedDate%>" required />
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <label for="inputATime" class="col-4 col-form-label">Appointment Time</label>
                        <div class="col-sm-8">
                            <input type="time" class="form-control" id="inputATime" name="a_time" required />
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-5">
                    <div class="row">
                        <label for="inputPID" class="col-4 col-form-label">Patient ID</label>
                        <div class="col-sm-8">
                            <!--<input type="number" class="form-control" id="inputPID" min="1" name="p_id" required />--> 

                            <select class="form-select" id="inputPID" aria-label="Default select inputGender" name="p_id">
                                <option value="0" selected disabled>Choose the Patient</option>

                                <!--load the test list-->
                                <c:forEach var="item" items="${patientDetails}">
                                    <option value="${item.p_id}">${item.p_id}</option>                                                                  
                                </c:forEach>

                            </select>


                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <label for="inputTodayDate" class="col-4 col-form-label">Registration Date</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="inputTodayDate" name="r_date" value="<%= formattedDate%>" required readonly/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-6 row">
                    <label for="inputGender" class="col-3 col-form-label">Test List</label>
                    <div class="col-sm-8">
                        <select class="form-select" id="testSelector" aria-label="Default select inputGender" name="p_gender">
                            <option value="0" selected disabled>Choose the Test</option>

                            <!--load the test list-->
                            <c:forEach var="item" items="${testPacks}">
                                <c:if test="${item.is_deleted eq 'F'}">
                                    <option value="${item.t_id}">${item.t_name}</option>
                                </c:if>                                    
                            </c:forEach>

                        </select>
                    </div>
                    <div class="col-1">
                        <button class="btn btn-primary" id="btnTest">+</button>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table table-striped" id="testTable">
                    <thead>
                        <tr>
                            <th>Test ID</th>
                            <th>Test Name</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>

            <input type="text" class="" value="PATIENT" name="p_privileges" hidden />

            <div class="row justify-content-end">
                <div class="col-3">
                    <button type="submit" id="btnsubmit" class="btn btn-success w-100">Add Appointment</button>
                </div>
                <div class="col-1"></div>
            </div>
            <!--</form>-->
        </div>

        



        <!--Footer css taglist-->
        <div class="footer container-fluid text-center py-4">
            <p>All right received</p>
        </div>


        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="jQuery/jquery-3.7.1.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                //Add the test package to table
                let addedTest = [];
                $("#btnTest").click(function () {

                    let id = $('#testSelector').find(":selected").val();
                    let name = $('#testSelector').find(":selected").text();


                    if (addedTest.includes(id) || id == 0) {
                        alert("Add the correct Test");
                    } else {
                        addedTest.push(id);
                        $('#testTable > tbody:last-child').append('<tr><td>' + id + '</td><td>' + name + '</td><td><button class="btn btn-danger btntestremove" > X </button></td></tr>');

                    }

                });

                //remove the table row
                $('#testTable').on('click', '.btntestremove', function () {


                    //remove the index withing array 
                    let index = addedTest.indexOf($(this).closest('tr').find('td:first').text());
                    if (index !== -1) {
                        addedTest.splice(index, 1);
                    }

                    $(this).closest('tr').remove();
                });


                $('#btnsubmit').click(function () {

                    let a_id = $("#inputID").val();
                    let a_date = $("#inputADate").val();
                    let a_time = $("#inputATime").val();
                    let p_id = $('#inputPID').find(":selected").val();
                    let r_date = $("#inputTodayDate").val();

//                    console.log(a_id + " " + a_date + " " + a_time + " " + p_id + " " + r_date);

                    var firstColumnValues = [];
                    $('#testTable tbody tr').each(function () {
                        var firstColumnValue = $(this).find('td:first').text();
                        firstColumnValues.push(firstColumnValue);
                    });

                    console.log(firstColumnValues);

                    var jsonData = JSON.stringify(firstColumnValues);

                    if (a_date == "" || a_time == "" || p_id == 0 || firstColumnValues.length == 0) {
                        alert("Enter Correct details");
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: 'Appointment-List',
                            data: {
                                command: "ADD",
                                a_id: a_id,
                                a_date: a_date,
                                a_time: a_time,
                                p_id: p_id,
                                r_date: r_date,
                                testIDs: jsonData

                            },
                            success: function (response) {
//                                console.log("Success");
                                window.location.href = "Admin-Home";

                            },
                            error: function (xhr, status, error) {
                                // Handle error response
                            }
                        });
                    }



                });

            })
        </script>
    </body>
</html>


