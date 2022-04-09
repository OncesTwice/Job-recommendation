<%-- 
    Document   : login
    Created on : Mar 20, 2022, 9:58:22 PM
    Author     : billg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <h1 style="color: red;">${message}</h1>
        <form:form method="post" action="/SpringDemo/login" modelAttribute="user" >
            Username: <form:input path="username" />
            Password: <form:password path="password" />
            <input type="submit" value="Login"/>
        </form:form>
    </body>
</html>
