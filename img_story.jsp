<%-- 
    Document   : img_story
    Created on : 17 Nov, 2021, 11:17:28 AM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>
<%
            if(request.getParameter("code")==null){
                response.sendRedirect("story.jsp?code_error=1");
            }
            else{
                String code = request.getParameter("code") ;
                            %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Vivah.com</title>
   <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <script src="https://use.fontawesome.com/09901d9403.js"></script>
   <style>
        .navbar-nav{
            cursor:pointer;
            font-family: Georgia, serif;
        }
	a{
            cursor: pointer;
        }
        .breadcrumb1 {
            margin-top:25px; 
        }
        .breadcrumb1 ul{
                padding:0;
                margin:0;
                list-style:none;
        }
        .breadcrumb1 li {
            position: relative;
            margin-right: 10px;
            padding-right: 10px;
            display: inline-block;
            color:#000;
            font-size: 20px;
        }
        .breadcrumb1 li a {
            display:inline-block;
            color:#c32143;
        }
        .breadcrumb1 li a:hover{
                color:#000;
                text-decoration:none;
        }
        i.home_1{
                color:#c32143;
                font-size:20px;
        }
        span.divider {
            padding: 0 5px;
            color: #ccc;
        }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<b><a class="navbar-brand" href="index.jsp">Vivah.com</a></b>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
		  <li class="nav-item">
			<a class="nav-link" href="index.jsp">Home</a>
		  </li>
		  <li class="nav-item">
                      <a class="nav-link"  href="edit_profile.jsp">Edit Profile</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link"  href="inbox.jsp">Inbox</a>
                  </li>
                <li class="nav-item">
                   <a class="nav-link" href="change_pass.jsp" >Change Password</a>
                </li>
		  <li class="nav-item">
			<a class="nav-link" href="contact.jsp">Contact</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="about.jsp">About us</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="logout.jsp">Logout</a>
		  </li>	 
		</ul>
	  </div>  
	</nav>
	
	<div class="container-fluid">
		<div class="row" id="main-block" style="background-image:url(image/pink.jpg);height:100vh">
			<div class="col-sm-12">
				<div class="container">
                                    <div class="breadcrumb1">
                                        <ul>
                                           <a href="index.jsp"><i class="fa fa-home home_1"></i></a>
                                           <span class="divider">&nbsp;|&nbsp;</span>
                                           <li class="current-page">Upload Story Image</li>
                                        </ul>
                                      </div>
				   <div class="row" style="margin-top:100px">
						<div class="col-sm-8" id="inbox">
							<div class="row w3-card-4"  style="background-color:white" id="user">
							    <div class="col-sm-12"><br><br></div>
								<div class="col-sm-8">
								    <form method="post" ACTION="storyimg.jsp?code=<%=code%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                                                                        <lable class="form-label" style="font-family:roboto;font-size: 20px;">Story Image</label><br><br>
                                                                        <input type="file" name="uploadFile" class="form-control"><br>
                                                                        <input type="submit" name="Submit" value="Upload" class="btn btn-primary">
                                                                    </form>
								</div>
                                                            <div class="col-sm-12"><br><br></div>
						    </div>
						    <div class="col-sm-12"><br><br></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


<%
                      
        }  
%>

