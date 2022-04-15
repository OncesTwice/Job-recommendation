<%-- 
    Document   : login
    Created on : Apr 15, 2022, 5:23:39 PM
    Author     : baoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JR</title>
        <link rel="stylesheet" href="resources/css/login.css"/>
    </head>
    <body>
        <div class="login">
            <div class="imgcontainer">
                <img
                    class="avatar"
                    src="resources/images/logo.png"
                    alt="logo"
                    />
            </div>

            <form class="input" onsubmit="login(event)" >
                <label for="uname"><b>Username</b></label>
                <input type="text" id="email" placeholder="Enter Username" name="uname" required />
                <label for="psw"><b>Password</b></label>
                <input
                    type="password"
                    id="pwd"
                    placeholder="Enter Password"
                    name="psw"
                    required
                    />

                <!--<button href="/Html/home.html">-->
                    <input type="submit" value="Login" class="loginButton"/>
                <!--</button>-->

                <label>
                    <input type="checkbox" checked="checked" name="remember" /> Remember me
                </label>
                <div class="psw" style="text-decoration: none;">
                    Not a member? <a href="http://localhost:8080/SpringDemo/signup">Signup</a>
                </div>
            </form>

            <!--      <div class="container" style="background-color: #f1f1f1" >
                    <button type="button" class="cancelbtn">Cancel</button>
                    
                     <span class="psw">Not a member? <a href="#">Signup</a></span> 
                  </div>-->
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script src="resources/js/login.js"></script>

    </body>
</html>
