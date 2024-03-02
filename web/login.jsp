<%-- 
    Document   : login
    Created on : Feb 28, 2024, 12:12:19 AM
    Author     : Tharindu Konesh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f2f2f2;
            }

            .login-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            }

            .login-container h2,h1 {
                margin-top: 0;
                text-align: center;
            }

            .login-form input[type="text"],
            .login-form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .login-form input[type="submit"] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 15px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .login-form input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>

        <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="login-container">
            <h1>ABC Laboratory System</h1>
            <!--<h2>Login</h2>-->


            <c:if test="${LoginResponse == 'No_Login'}">
                <div class="alert alert-danger" role="alert" id="loginResponseAlert">
                    Your Username or Password is wrong check again...!! 
                </div>

            </c:if>


            <form class="login-form" action="LoginController" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" value="Login">
            </form>
        </div>


        <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js" type="text/javascript"></script>

        <script>

            document.addEventListener("DOMContentLoaded", function (event) {

                var alert = document.getElementById('loginResponseAlert');

                setTimeout(function () {
                    alert.style.display = 'none';
                }, 5000);
            });
        </script>
    </body>
</html>

