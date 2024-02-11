 
<%@page import="com.tech.station.entities.User"%>
<%@page import="com.tech.station.dao.LikesDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.station.entities.Post"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.tech.station.helper.ConnectionProvider"%>
<%@page import="com.tech.station.dao.PostDao"%>
<div class="contatiner">
    <div class="row">
        <%
            User user = (User) session.getAttribute("currentUser");
            LikesDao ld = new LikesDao(ConnectionProvider.getConnection());

            Thread.sleep(1000);

            PostDao pd = new PostDao(ConnectionProvider.getConnection());
            int Cid = Integer.parseInt(request.getParameter("cid"));
            List<Post> post = null;
            if (Cid == 0) {
                post = pd.getAllPost();
            } else {
                post = pd.getPostByCatId(Cid);
            }

            if (post.size() == 0) {
                out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
            }

            for (Post p : post) {
        %>
        <div class="col-md-6  mb-2">
            <div class="card" >
                <img src="Blog-pics/<%= p.getPpic()%>" class="card-img-top" alt="...">
                <div class="card-body">

                    <h5 class="card-title"><%= p.getPtitle()%></h5>
                    <p class="card-text"><%= p.getPcontent()%></p>
                </div>
                <div class="card-footer" style="display: flex; flex-direction: row ; justify-content: space-between">

                    <div>
                        <a href="show_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary ">Read more..</a>  
                    </div>
                    <div> 
                        <a href="#" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary">
                            <i class="fa-regular fa-thumbs-up"></i> <span class="count_like"><%= ld.countLikesOnPost(p.getPid())%></span> 
                        </a>
                        
                            
                        <a href="#" class="btn btn-outline-primary "><i class="fa-regular fa-comment"></i></a>

                    </div>


                </div>
            </div>
        </div>

        <%
            }
        %>



    </div>
</div>
