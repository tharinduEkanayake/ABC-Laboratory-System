<%-- 
    Document   : testDetailsModel
    Created on : Mar 6, 2024, 10:18:59 PM
    Author     : Tharindu Konesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Test List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Report ID</th>
                            <th>Test Name</th>
                            <th>Test Date</th>
                            <th>Test Time</th>
                            <th>Technician ID</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="items" items="${testList}" >
                            <tr>                           
                                <td>${items.test_repo_id}</td>
                                <td>${items.t_name}</td>
                                <td>${items.t_report_data}</td>
                                <td>${items.tr_time}</td>
                                <c:if test="${items.technician_id != ''}">
                                    <td>${items.technician_id}</td>   
                                </c:if>
                                <c:if test="${items.technician_id eq ''}">
                                    <td></td>   
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>