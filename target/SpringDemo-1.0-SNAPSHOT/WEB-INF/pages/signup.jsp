<%-- 
    Document   : signup
    Created on : Apr 15, 2022, 5:24:59 PM
    Author     : baoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/css/signup.css"/>
    </head>
    <body>
        <form class="container">
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label for="firstname"><b>Firstname</b></label>
            <input type="text" id="firstname" placeholder="Enter Firstname" name="firstname" required>

            <label for="lastname"><b>Lastname</b></label>
            <input type="text" id="lastname" placeholder="Enter Lastname" name="lastname" required>

            <label for="phone"><b>Phone</b></label>
            <input type="text" id="phone" placeholder="Enter Phone" name="phone" required>

            <label for="age"><b>Age</b></label>
            <input type="text" id="age" placeholder="Enter Age" name="age" required>

            <label for="email"><b>Email</b></label>
            <input type="text" id="email" placeholder="Enter Email" name="email" required>

            <label for="pwd"><b>Password</b></label>
            <input type="password" id="pwd" placeholder="Enter Password" name="pwd" required>

            <label>
                <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
            </label>

            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

            <div class="clearfix">
                <button type="button" class="cancelbtn">Cancel</button>
                <button type="submit" class="signupbtn" onclick="signup(event)">Sign Up</button>

            </div>
        </form>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script>
                    const signup = async (event) => {
                        event.preventDefault()
                        const email = document.getElementById("email").value
                        const password = document.getElementById("pwd").value
                        const firstname = document.getElementById("firstname").value
                        const lastname = document.getElementById("lastname").value

                        const phone = document.getElementById("phone").value
                        const age = document.getElementById("age").value

                        if (!email || email.length < 5)
                            return Alert({error: `Register Fail : Input not valid!`})
                        if (!password || password.length < 5)
                            return Alert({error: `Register Fail : Input not valid!`})
//                        if (!firstname || firstname.length < 4)
//                            return Alert({error: `Register Fail : Input not valid!`})
//                        if (!lastname || lastname.length < 4)
//                            return Alert({error: `Register Fail : Input not valid!`})
                        const _data = {
                            firstname,
                            lastname,
                            phone,
                            age: Number(age),
                            email,
                            password
                        }

//                        const _data = {
//                            "email": "bao1@gmail.com",
//                            "password": "123456",
//                            "phone": "0900000000",
//                            "age": 22,
//                            "firstname": "hoang",
//                            "lastname": "bao"
//                        }
                        console.log(_data)
                        const res = await fetch('http://localhost:8080/SpringDemo/register', {
                            method: "POST",
                            body: JSON.stringify(_data),
                            headers: {"Content-type": "application/json;charset=UTF-8"}
                        })
                        const json = await res.json()
                        console.log(json)
                        if (json.message !== "success") {
                            return Alert({error: `Login Fail : ${json.message}!`})
//                            document.getElementById("error").innerHTML = json.message
//                            return document.getElementById("error").style.display = "";
                        }
                        Alert({success: "Registered success!"})
                        window.location.href = "http://localhost:8080/SpringDemo/"
                    }
        </script>
    </body>
</html>
