<%-- 
    Document   : signup_page
    Created on : Jan 26, 2024, 5:55:37 PM
    Author     : Yogeshwar_Info
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/signup.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color: blue;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="card_containt " >
                            <div class="title" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                <h3>Register here</h3>
                            </div>
                            <form action="RegisterServlet" class="myform" method="POST">
                                <div class="form-floating mb-2">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="UserName" name="username">
                                    <label for="floatingInput">UserName</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="form-floating mb-2">
                                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="useremail">
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div style="display: flex; flex-direction: row;">
                                    <div class="form-check mb-2" style="margin-right: 10px">
                                        <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="male">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="female">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Female
                                        </label>
                                    </div>
                                </div>

                                <div class="form-floating mb-2">
                                    <textarea class="form-control" placeholder="Leave a comment here"  name="about" id="floatingTextarea2" style="height: 100px"></textarea>
                                    <label for="floatingTextarea2">About</label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault" style="font-size: small" >
                                        Terms & Conditions
                                    </label>
                                </div>
                                <div class="btn" style="display: flex; flex-direction: row; justify-content: center ; align-items: center;">
                                     <input class="btn btn-primary mb-2" type="submit" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </body>
</html>
