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
        <title>Register_page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />



        <style>
            .banner-background{
                clip-path: polygon(0 0, 95% 0, 100% 100%, 5% 100%);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>



        <div class="container-fluid primary-background banner-background">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <br>

                    <div class="card" style="border:2px solid white; border-radius: 5px">

                        <div class="card_head">
                            <div class="title primary-background" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                                <span class="display-4"><i class="fa-solid fa-circle-user"></i></span>
                                <h3>Register here</h3>
                            </div>
                        </div>
                        <div class="card_main " >

                            <form  id="reg-form"action="RegisterServlet" class="myform primary-background" method="POST">
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
                                    <input class="form-check-input" type="checkbox" value="checked" name="check" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault" style="font-size: small" >
                                        Terms & Conditions
                                    </label>
                                </div>
                                <div id="loader-btn" class="loader text-center" style="display:none" >
                                    <button class="btn btn-primary" type="button" disabled>
                                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                        Loading...
                                    </button>


                                </div>
                                <div class="btn" id="submit-btn" style="display: flex; flex-direction: row; justify-content: center ; align-items: center;">
                                    <input class="btn btn-primary mb-2" type="submit" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                </div>    
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            $(document).ready(function () {
                console.log("loaded...");

                $("#reg-form").on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader-btn").show();

                    $.ajax({
                        url: "RegisterServlet",
                        data: form,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader-btn").hide();



                            if (data.trim() === "done") {

                                swal.fire("Signup Successfull..... Redirecting to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });

                            } else {
                                Swal.fire(data);
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);

                            $("#submit-btn").show();
                            $("#loader-btn").hide();

                            Swal.fire({
                                icon: "error",
                                title: "Oops...",
                                text: "Something went wrong!"

                            });
                        },
                        processData: false,
                        contentType: false

                    })

                })

            })
        </script>

    </body>
</html>
