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
						<div class="card-header"><h4>Register</h4></div>
                                                <div class="card-body" >
                                                    <%
                                                        if(request.getParameter("success")!=null){
                                                            out.println("<h3 class='alert alert-success'>Record Updated Successfully !</h3>");
                                                        }
                                                        else if(request.getParameter("empty")!=null){
                                                            out.println("<h3 class='alert alert-warning'>All Field Required !</h3>");
                                                        }
                                                        else if(request.getParameter("again")!=null){
                                                            out.println("<h3 class='alert alert-danger'>Try Again !</h3>");
                                                        }
                                                    %>
                                                        <form  method="post" action="insert_rec.jsp">
                                                        <label class="form-label">Username :<span class="form-required" style="margin-left:260px;" title="This field is required.">*</span></label>
                                                        <input type="text" name="username" class="form-control" id="name" required><br>
                                                        <label class="form-label">Email :<span class="form-required" style="margin-left:295px;" title="This field is required.">*</span></label>
                                                        <input type="text" name="email" class="form-control" id="email" required><br>
                                                        <label class="form-label">Password :<span class="form-required" style="margin-left:265px;" title="This field is required.">*</span></label>
                                                        <input type="password" name="pass" class="form-control" id="pass" required><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="control-lable" for="sex">Gender : <span class="form-required" style="margin-left:275px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <div class="radios">
                                                                                <label for="radio-01" class="label_radio">
                                                                                        <input type="radio" name="gender" value="male"> Male
                                                                                </label>&nbsp;&nbsp;
                                                                                <label for="radio-02" class="label_radio">
                                                                                        <input type="radio" name="gender" value="female"> Female
                                                                                </label>
                                                                        </div>					
                                                                </div>
                                                        </div><br>
                                                        <label class="form-label">DOB :<span class="form-required" style="margin-left:300px;" title="This field is required.">*</span></label>
                                                        <input type="date" name="dob" class="form-control" id="dob" required><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="form-label">Caste :<span class="form-required" style="margin-left:295px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <select name="caste" class="form-control">
                                                                                <option value="Gupta">Gupta</option>
                                                                                <option value="Kumawat">Kumawat</option>
                                                                                <option value="Rajput">Rajput</option>
                                                                                <option value="Goyal">Goyal</option>
                                                                                <option value="Sinha">Sinha</option>
                                                                                <option value="Singh">Singh</option>
                                                                                <option value="Khan">Khan</option>
                                                                                <option value="Khan">Dudi</option>
                                                                                <option value="Khan">Nai</option>
                                                                                <option value="Khan">Koshik</option>
                                                                                <option value="Khan">Saharan</option>
                                                                                <option value="Khan">Dhedu</option>
                                                                                <option value="Khan">Bhadu</option>
                                                                                <option value="Khan">Sharma</option>
                                                                                <option value="Khan">Modi</option>
                                                                                <option value="Khan">Bansal</option>
                                                                        </select>
                                                                </div>
                                                        </div><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="form-label">Religion :<span class="form-required" style="margin-left:275px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <select name="religion" class="form-control">
                                                                                <option value="Hindu">Hindu</option>
                                                                                <option value="Muslim">Muslim</option>
                                                                                <option value="Sikh">Sikh</option>
                                                                                <option value="Parsi">Parsi</option>
                                                                                <option value="Buddhism">Buddhism</option>
                                                                                <option value="not defien">Other</option>
                                                                        </select> 
                                                                </div>
                                                        </div><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="form-label">Occupation :<span class="form-required" style="margin-left:250px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <select name="occupation" class="form-control">
                                                                                <option value="Engineer">Engineer</option>
                                                                                <option value="Doctor">Doctor</option>
                                                                                <option value="Actor">Actor</option>
                                                                                <option value="Technician">Technician</option>
                                                                                <option value="Teacher">Teacher</option>
                                                                                <option value="Pharmacist">Pharmacist</option>
                                                                                <option value="Software Developer">Software Developer</option>
                                                                                <option value="Scientist">Scientist</option>
                                                                                <option value="Psychologist">Psychologist</option>
                                                                                <option value="Architech">Architech</option>
                                                                                <option value="Physcian">Physician</option>
                                                                                <option value="Accountant">Accountant</option>
                                                                                <option value="Machinist">Machinist</option>
                                                                                <option value="Technologist">Technologist</option>
                                                                                <option value="Electrician">Electrician</option>
                                                                        </select> 
                                                                </div>
                                                        </div><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="form-label">State :<span class="form-required" style="margin-left:295px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <select name="state" class="form-control">
                                                                                <option value="Asam">Asam</option>
                                                                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                                                <option value="Bihar">Bihar</option>
                                                                                <option value="Goa">Goa</option>
                                                                                <option value="Gujrat">Gujrat</option>
                                                                                <option value="Odisha">Odisha</option>
                                                                                <option value="Rajsthan">Rajsthan</option>
                                                                                <option value="not define">Other</option>
                                                                        </select> 
                                                                </div>
                                                        </div><br>
                                                        <div class="col-sm-12">
                                                                <div class="row">
                                                                        <label class="form-label">Country :<span class="form-required" style="margin-left:275px;" title="This field is required.">*</span></label>&nbsp;&nbsp;
                                                                        <select name="country" class="form-control"> 
                                                                                <option value="India">India</option>
                                                                                <option value="United States">United States</option>
                                                                                <option value="Australia">Australia</option>
                                                                                <option value="China">China</option>
                                                                                <option value="Bangladesh">Bangladesh</option>
                                                                                <option value="Russia">Russia</option>
                                                                                <option value="not define">Other</option>
                                                                        </select> 
                                                                </div>
                                                        </div><br>
                                                    <!-- <label for="edit-name">Upload Picture <span class="form-required" style="margin-left:230px;" title="This field is required.">*</span></label>
                                                        <input type="file" name="photo" class="form-control"> 
                                                        <br>-->
                                                        <input type="submit" value="Register" class="btn btn-primary 2">
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