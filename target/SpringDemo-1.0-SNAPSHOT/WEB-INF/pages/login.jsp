<%-- 
    Document   : login
    Created on : Mar 20, 2022, 9:58:22 PM
    Author     : billg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<link href="<c:url value="/css/styles.css" />" rel="stylesheet"/>-->
<style type="text/css">
    <%@ include file="/WEB-INF/css/login.css"%>
</style>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <div class="wrapper">

            <form id="formLogin" class="login_form" onsubmit="a(event)">            
                <h1>Login</h1>
                <h3 style="color: red;display: none;text-align: center;" id="error">Login failed</h3>
                <input type="text" id="email" name="email" placeholder="Email:"/>
                <input type="password" id="pwd" name="password" placeholder="Password:" />
                <button type="submit">Login</button>
            </form>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                const a = async (event) => {
                    event.preventDefault()
                    const email = (document.getElementById("email").value)
                    const pwd = (document.getElementById("pwd").value)

                    alert(email + pwd)
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

                    console.log(json.message)
//                    console.log(dataJSON)

                    if (json.message.length === 0)
                        return document.getElementById("error").style.display = "";

                    window.location.href = "http://localhost:8080/SpringDemo/home"



                }

        </script>
    </body>
</html>
