<%-- 
    Document   : Index
    Created on : Mar 20, 2022, 9:20:10 PM
    Author     : billg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="<c:url value="/css/styles.css" />" rel="stylesheet"/>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
            <!-- Brand -->
            <a class="navbar-brand" href="/">WeddingNow</a>

            <!-- Toggler/collapsibe Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- FOOTER -->
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1>Bootstrap Tutorial</h1>
                    <p>Bootstrap is the most popular HTML, CSS... ${name}</p>
                </div>
            </div>
        </nav>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            const testAPI = async  () => {
                var res = await $.get(`http://localhost:8080/SpringDemo/api/test`)
                console.log(res)
            }
            testAPI()

            const testAPI1 = async  () => {
                var res = await $.get(`http://localhost:8080/SpringDemo/a`)
                console.log(res)
            }
            testAPI1()

            const testAPI2 = async  () => {
                try {
                    var res = await $.get(`http://localhost:8080/SpringDemo/b`)
                    console.log(res)
                } catch (e) {
                    console.log(e)
                }


            }
            testAPI2()
        </script>
    </body>
</html>
