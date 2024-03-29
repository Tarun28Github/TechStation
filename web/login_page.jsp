<%-- 
    Document   : login_page
    Created on : Jan 29, 2024, 8:23:41 PM
    Author     : Yogeshwar_Info
--%>

<%@page import="com.tech.station.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login_page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner-background{
                clip-path: polygon(0 0, 95% 0, 100% 100%, 5% 100%);
            }
        </style>

    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <div class="container-fluid  banner-background primary-background">
            <div class="container ">
                <br>
                <div class="row">

                    <div class="col-md-4 offset-4" style="border: 2px solid white; border-radius: 5px ">

                        <br>

                        <form action="LoginServlet" method="POST" >
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1"  class="form-label">Password</label>
                                <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
                            </div>
                            <%
                                Message m = (Message) session.getAttribute("msg");

                                if (m != null) {
                                    if (m.getCssClass() == "alert-danger") {
                            %>       
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </svg>
                                <div>
                                    <%= m.getContent()%>
                                </div>
                            </div> 
                            <%     } else {
                            %>
                            <div class="alert alert-success  d-flex align-items-center"  role="alert">
                                
                                <div>
                                    <%= m.getContent()%>
                                </div>
                            </div> 
                            <%
                                    }

                                    session.removeAttribute("msg");
                                }
                            %>


                            <div class="mb-3" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>

                        </form>
                    </div>
                </div>
                <br>
            </div> 
        </div>      





        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


    </body>
</html>
