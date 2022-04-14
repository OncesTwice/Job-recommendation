<%-- 
    Document   : login
    Created on : Mar 20, 2022, 9:58:22 PM
    Author     : billg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<link href="<c:url value="/css/styles.css" />" rel="stylesheet"/>-->
<link rel="stylesheet" href="resources/css/login.css"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <div class="wrapper">

            <form id="formLogin" class="login_form" onsubmit="login(event)">            
                <h1>Login</h1>
                <h3 style="color: red;display: none;text-align: center;" id="error">Login failed</h3>
                <input type="text" id="email" name="email" placeholder="Email:"/>
                <input type="password" id="pwd" name="password" placeholder="Password:" />
                <a class="redirect_register" href="http://localhost:8080/SpringDemo/register">Moving to Resgister?</a>
                <button type="submit">Login</button>
            </form>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script>
//                const account = JSON.parse(localStorage.getItem("account"));
//                if (account.role === "manager" || account.role === "employee")
//                    window.location.href = "http://localhost:8080/SpringDemo/dashboard"
//                if (account.role === "customer")
//                    window.location.href = "http://localhost:8080/SpringDemo/"

                const login = async (event) => {
                    event.preventDefault()
                    const email = (document.getElementById("email").value)
                    const password = (document.getElementById("pwd").value)

                    if (!email || email.length < 5)
                        return Alert({error: `Login Fail : Input not valid!`})
                    if (!password || password.length < 5)
                        return Alert({error: `Login Fail : Input not valid!`})

                    const _data = {
                        "email": document.getElementById("email").value,
                        "password": document.getElementById("pwd").value
                    }

                    const res = await fetch('http://localhost:8080/SpringDemo/login', {
                        method: "POST",
                        body: JSON.stringify(_data),
                        headers: {"Content-type": "application/json;charset=UTF-8"}
                    })
                    const json = await res.json()

                    const dataJSON = await json[0];

                    console.log(json.data)
//                    console.log(dataJSON)

                    if (json.data.length === 0) {
                        Alert({error: "Login error!"})
                        return document.getElementById("error").style.display = "";
                    }

                    await localStorage.setItem("account", JSON.stringify(json.data[0]))
                    Alert({success: "Login success!"})

                    if (json.data[0].role === "customer") 
                        window.location.href = "http://localhost:8080/SpringDemo/home"

                    if (json.data[0].role === "employee" || json.data[0].role === "admin" || json.data[0].role === "manager")
                        window.location.href = "http://localhost:8080/SpringDemo/dashboard"


                }

        </script>
    </body>
</html>
