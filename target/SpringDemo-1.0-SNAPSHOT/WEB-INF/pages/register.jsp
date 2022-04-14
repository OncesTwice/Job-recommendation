<%-- 
    Document   : signin
    Created on : Apr 10, 2022, 5:43:14 PM
    Author     : Kien Mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/css/register.css"/>
    </head>
    <body>
        <div class="wrapper">
            <form class="register_form" onsubmit="register(event)">
                <h1>Register</h1>
                <h3 style="color: red;display: none;text-align: center;" id="error">Register failed</h3>

                <input type="text" id="firstname" name="firstname" placeholder="Firstname:"/>
                <input type="text" id="lastname" name="lastname" placeholder="Lastname:" />
                <input type="text" id="email" name="email" placeholder="Email:"/>
                <input type="password" id="pwd" name="password" placeholder="Password:" />
                <a class="redirect_login" href="http://localhost:8080/SpringDemo/">Moving to Login ?</a>
                <button type="submit">Submit</button>
            </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script>
//                const load = () => {
//                    const account = JSON.parse(localStorage.getItem("account"));
//                    if (account.role === "manager" || account.role === "employee")
//                        window.location.href = "http://localhost:8080/SpringDemo/dashboard"
//                    if (account.role === "customer")
//                        window.location.href = "http://localhost:8080/SpringDemo/"
//                }
//                
//                load()


                const register = async (event) => {
                    event.preventDefault()
                    const email = document.getElementById("email").value
                    const password = document.getElementById("pwd").value
                    const firstname = document.getElementById("firstname").value
                    const lastname = document.getElementById("lastname").value

                    if (!email || email.length < 5)
                        return Alert({error: `Register Fail : Input not valid!`})
                    if (!password || password.length < 5)
                        return Alert({error: `Register Fail : Input not valid!`})
                    if (!firstname || firstname.length < 4)
                        return Alert({error: `Register Fail : Input not valid!`})
                    if (!lastname || lastname.length < 4)
                        return Alert({error: `Register Fail : Input not valid!`})

                    const _data = {
                        email,
                        password,
                        firstname,
                        lastname
                    }

                    const res = await fetch('http://localhost:8080/SpringDemo/register', {
                        method: "POST",
                        body: JSON.stringify(_data),
                        headers: {"Content-type": "application/json;charset=UTF-8"}
                    })
                    const json = await res.json()

                    console.log(json)

                    if (json.message !== "success") {
                        Alert({error: `Login Fail : ${json.message}!`})
                        document.getElementById("error").innerHTML = json.message
                        return document.getElementById("error").style.display = "";

                    }
                    Alert({success: "Registered success!"})
                    window.location.href = "http://localhost:8080/SpringDemo/"
                }
        </script>
    </body>
</html>
