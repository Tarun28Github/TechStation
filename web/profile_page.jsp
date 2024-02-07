<%-- 
    Document   : Profile.jsp
    Created on : Jan 31, 2024, 3:35:52 PM
    Author     : Yogeshwar_Info
--%>

<%@page import="com.tech.station.entities.Categorie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.station.helper.ConnectionProvider"%>
<%@page import="com.tech.station.dao.PostDao"%>
<%@page import="com.tech.station.entities.Message"%>
<%@page import="com.tech.station.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile_page.jsp</title>
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

        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <span class="bg-secondary text-light" style="width:120px; height: 40px; font-size: 20px ; display: flex;flex-direction: row; justify-content: center; align-items: center"<a class="navbar-brand" href="index.jsp"><b>TechStation</b></a></span>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active " aria-current="page" href="#"><i class="fa fa-code"></i>CodeExpress </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-layer-group"></i>Catagories
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Programming language</a></li>
                                <li><a class="dropdown-item" href="#">DataStructure</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Development</a></li>
                            </ul>
                        </li>                        

                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa-solid fa-address-card"></i>Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="modal" data-bs-target="#add-post-modal" href="#"><i class="fa-solid fa-square-plus"></i> Post</a>
                        </li>

                    </ul>
                    <span class="nav-item">
                        <a  href="#!" class=" nav-link text-secondary" tabindex="-1" data-bs-toggle="modal" data-bs-target="#profileModal" ><i class="fa-solid fa-user" ></i> <%= user.getName()%></a>
                    </span>

                    <span class="nav-item">
                        <a class="nav-link  text-secondary" href="LogoutServlet" tabindex="-1"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                    </span>

                </div>
            </div>
        </nav>

        <!--navbar end-->
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


        <!--profile model-->

        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-secondary">
                        <h5 class="modal-title " id="exampleModalLabel">TechStation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="contatiner text-center">

                            <img  src="pics/<%= user.getProfile()%>" style="border-radius: 50%;max-width:120px; " alt=""/>
                            <h5 class="modal-title mt-1" id="exampleModalLabel"><%= user.getName()%></h5>
                            <div id="profile-detail" >
                                <table  class="table">

                                    <tbody>
                                        <tr>
                                            <td>Id :</td>
                                            <td><%= user.getId()%></td>                                       
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><%= user.getEmail()%></td>      
                                        </tr>
                                        <tr>
                                            <td >Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td >Status :</td>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <td >Registered on :</td>
                                            <td><%= user.getSignup_date()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit"  style="display: none" >
                                <form class="form-control" action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <td>Id :</td>
                                                <td><%= user.getId()%></td>                                       
                                            </tr>
                                            <tr>
                                                <td>Name :</td>
                                                <td><input type="text" name="user_name" value="<%= user.getName()%>"></td>      
                                            </tr>
                                            <tr>
                                                <td>Email :</td>
                                                <td><input type="email" name="user_email" value="<%= user.getEmail()%>"></td>      
                                            </tr>
                                            <tr>
                                                <td>Password :</td>
                                                <td><input type="password" name="user_password" value="<%= user.getPassword()%>"></td>
                                            </tr>
                                            <tr>
                                                <td >Gender :</td>
                                                <td><%= user.getGender().toUpperCase()%></td>
                                            </tr>
                                            <tr>
                                                <td >About :</td>
                                                <td><textarea rows-3 class="form-control" name="user_about" ><%= user.getAbout()%></textarea> </td>
                                            </tr>
                                            <tr>
                                                <td >Profile pic :</td>
                                                <td><input type="file" name="user_image"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-outline-success" >Save</button>
                                    </div>
                                </form>
                            </div>          

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>        


        <!--end of profile model-->

        <!--start of post modal-->

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST" >
                            <div class="form-group mb-2">
                                <select class="form-control" name="cid">
                                    <option selected disable>--select categories--</option>
                                    <%
                                        PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Categorie> list = pd.getAllCategories();
                                        for (Categorie c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>    

                                </select>
                            </div>

                            <div class="form-group mb-2" >
                                <input name="ptitle" class="form-control" type="text" placeholder="Enter the title"/>
                            </div>

                            <div class="form-group mb-2">
                                <textarea  name="pcontent" class="form-control" style="height:150px; " placeholder="Enter your content"></textarea>
                            </div>

                            <div class="form-group mb-2">
                                <textarea  name="pcode" class="form-control" style="height:150px; " placeholder="Enter your code"></textarea>
                            </div>

                            <div class="form-group mb-2">
                                <label>Select pic</label>
                                <input name="ppic" type="file" class="form-control" />                                
                            </div>
                            <div class="container text-end mb-2">
                                
                                <button type="submit" class="btn btn-outline-success">Post</button>

                            </div>        

                        </form>                     
                    </div>


                </div>
            </div>
        </div>

        <!--end of post modal-->





        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {

                let editstatus = false;
                $("#edit-profile-button").click(function () {

                    if (editstatus === false) {
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        editstatus = true;
                    } else {
                        $("#profile-detail").show();
                        $("#profile-edit").hide();
                        editstatus = false;
                    }
                });

            });

        </script>

        <!--script for post-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code get called when form is submit..
                    console.log("btn clicked");
                    event.preventDefault();

                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error...
                        },
                        processData: false,
                        contentType: false
                    });

                });

            });

        </script>

    </body>
</html>
