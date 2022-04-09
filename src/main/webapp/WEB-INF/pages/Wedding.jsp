<%-- 
    Document   : Wedding
    Created on : Apr 7, 2022, 4:03:50 PM
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
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
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

        <!-- Navbar links -->
          <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#">Home</a>
              </li>
            </ul>             
          </div>    

        <c:url value="/" var="homeAction" />
        <form class="form-inline" action="${homeAction}">
            <input class="form-control mr-sm-2" 
                   name="kw"
                   type="text" placeholder="Search">
            <button class="btn btn-success" type="submit">Search</button>
        </form>        
        </nav>
            <div class="container">
                <h1 class="text-center text-danger">WEDDING MANAGERMENT</h1>
                
                <c:if test="${errMsg != null}">
                    <div class="alert alert-danger">
                        ${errMsg}
                    </div>
                </c:if>
                <form:form method="post" action="" modelAttribute="wedding" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Wedding name</label>
                        <form:input path="name" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Wedding price</label>
                        <form:input path="price" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Wedding img</label>
                        <form:input type="file" path="file" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Wedding duration</label>
                        <form:input path="duration" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Wedding detail</label>
                        <form:input path="detail" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Wedding start date</label>
                        <input type="text" name="start_date" id="datepicker">
                    </div>
                    
                    <input type="submit" value="Add Wedding" class="btn btn-danger" />
                </form:form>
            </div>
            
            <br>
            <br>
            

     
        <!-- FOOTER -->
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Bootstrap Tutorial</h1>
                <p>Bootstrap is the most popular HTML, CSS...</p>
            </div>
        </div>
    </body>
</html>

