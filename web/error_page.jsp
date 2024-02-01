<%-- 
    Document   : error_page
    Created on : Jan 31, 2024, 12:25:03 PM
    Author     : Yogeshwar_Info
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sorry ! some thing went wrong</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png"  class="img-fluid" alt="alt"/>
            <h3 class="display-3">Sorry ! Something went wrong...</h3> 
            <a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </body>
</html>
