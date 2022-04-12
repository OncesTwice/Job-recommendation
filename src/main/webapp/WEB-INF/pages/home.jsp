<%-- 
    Document   : home.jsp
    Created on : Apr 10, 2022, 11:16:17 AM
    Author     : Kien Mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 onclick="logout()">Home</h1>

        <script>
            const logout = () => {
                localStorage.removeItem("account")
            }
        </script>
    </body>
</html>
