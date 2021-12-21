<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  try{
            String email = null;
            Cookie c[] = request.getCookies();
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("user")){
                    email = c[i].getValue();
                    break;
                }
            }
            if(email!=null){
                response.sendRedirect("view_profile.jsp");
            }
            else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vivah.com</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://kit.fontawesome.com/1d5faa0c8e.js" crossorigin="anonymous"></script>
		<style>
			.w3-card-4{
				margin-top: 100px;
				margin-left: 300px;
			}
			ul{
				margin-left: 50px;
				font-family: arial;
				color: blue;
			}
                        a{
                            cursor: pointer;
                        }
                </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<b><a class="navbar-brand" href="index.php">vivah.com</a></b>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
			  <li class="nav-item">
				<a class="nav-link" href="index.php">Home</a>
			  </li>
			<li class="nav-item">
                            <a class="nav-link" style="cursor:pointer" href="login.jsp">Login</a>
			</li>
			<li class="nav-item">
                            <a class="nav-link" style="cursor:pointer" href="register.jsp">Register</a>
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
		<div class="container-fluid" style="background-image:url(image/login.jpg);height:100%;">
			<div class="row">
				<div class="col-sm-8">
					<div class="card w3-card-4" style="width:400px" id="rec">
						<div class="card-header"><h4>Login</h4></div>
						<div class="card-body" >
                                                    <%
                                                        if(request.getParameter("empty")!=null){
                                                            out.println("<h3 class='alert alert-warning'>All Field Required !</h3>");
                                                        }
                                                        else if(request.getParameter("pass_invalid")!=null){
                                                            out.println("<h3 class='alert alert-danger'>Invalid Password !</h3>");
                                                        }
                                                        else if(request.getParameter("email_invalid")!=null){
                                                            out.println("<h3 class='alert alert-danger'>Invalid Email !</h3>");
                                                        }
                                                    %>
							<form method="post" action="check.jsp">
								<label class="form-label">Email :<span class="form-required" style="margin-left:295px;" title="This field is required.">*</span></label>
								<input type="text" name="email" class="form-control" id="email" required><br>
								<label class="form-label">Password :<span class="form-required" style="margin-left:265px;" title="This field is required.">*</span></label>
								<input type="password" name="pass" class="form-control" id="pass" required><br>
								<input type="submit" value="Login" class="btn btn-primary">
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-4" style="margin-top:120px;">
					<ul class="footer_social" style="color:white;">
						<h3 style="font-family:fira-sans;font-size:30px;border-bottom: 1px solid #fff;width:200px;">Follow us on :</h3><br>
						<li><a href="" style="font-size:25px;"><i class="fa fa-facebook-square" aria-hidden="true"> &nbsp;Facebook</i></a></li> &nbsp;
						<li><a href="" style="font-size:25px;"><i class="fa fa-instagram" aria-hidden="true"> &nbsp;Instagram</i></a></li> &nbsp;
						<li><a href="" style="font-size:25px;"><i class="fa fa-twitter-square" aria-hidden="true"> &nbsp;Twitter</i></a></li>
					</ul>
				</div>
			</div><br><br><br>
			<div class="row">
			
			</div>
		</div>
		<div class="container-fluid" style="background-image:url(image/footer.jpg);height:100%;color:white;">
			<div class="row" style="margin-left:40px;">
				<div class="col-sm-3" >
					<h3 style="border-bottom: 1px solid #000; width:10rem;">Need Help?</h3>
					<a href="login.jsp">Member Login</a><br>
					<a href="Search.jsp">Search</a>
				</div>
				<div class="col-sm-3" >
					<h3 style="border-bottom: 1px solid #000; width:10rem;">Company</h3>
					<a href="about.jsp">About us</a><br>
					<a href="contact.jsp">Contact us</a><br>
					<a href="blog.jsp">Vivah Blog</a>
				</div>
				<div class="col-sm-3" >
					<h3 style="border-bottom: 1px solid #000; width:10rem;">Privacy & You</h3>
					<a href="term.jsp">Terms of Use</a><br>
					<a href="policy.jsp">Privacy Policy</a><br>
					<a href="report.jsp">Report Misuse</a>
				</div>
				<div class="col-sm-3" ">
					<h3 style="border-bottom: 1px solid #000; width:10rem;">More</h3>
					<a href="login.jsp">VIP Shaadi</a><br>
					<a href="meet.jsp">Shaadi Meet</a><br>
					<a href="story.jsp">Success Stories</a>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6" style="padding:20px;">
					<div style="margin-left:40px;">
						<h3>Follow us on :</h3>
						<a href="" style="font-size:25px;"><i class="fa fa-facebook-square" aria-hidden="true"></i></a> &nbsp;
						<a href="" style="font-size:25px;"><i class="fa fa-instagram" aria-hidden="true"></i></a>&nbsp;
						<a href="" style="font-size:25px;"><i class="fa fa-twitter-square" aria-hidden="true"></i></a>
					</div>
				</div>
				<div class="col-sm-6" style="padding:40px;">
					<center>© 1996-2021 Vivah.com, The World's Leading Matchmaking Service™ <br> All rights reserved and created by Rahul Bhati</center>
				</div>
			</div>
		</div>
	</body>
</html>
<%
            }
        }
        catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }  
%>