<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>
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
            if(email==null){
                response.sendRedirect("index.jsp");
            }
            else{
                try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                        if(rs.next()){
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
                    <a class="nav-link" href="story.jsp" >Story</a>
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
		<div class="row" id="main-block" style="background-image:url(image/pink.jpg);height:auto">
			<div class="col-sm-12">
				<div class="container">
                                    <div class="breadcrumb1">
                                        <ul>
                                           <a href="index.jsp"><i class="fa fa-home home_1"></i></a>
                                           <span class="divider">&nbsp;|&nbsp;</span>
                                           <li class="current-page">View Profile</li>
                                        </ul>
                                      </div>
				   <div class="row" style="margin-top:100px">
						<div class="col-sm-8" id="inbox">
							<div class="row w3-card-4"  style="background-color:white" id="user">
							    <div class="col-sm-12"><br><br></div>
								<div class="col-sm-4">                                
								    <img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid">
								</div>
								<div class="col-sm-8">
								     <table class="table table-hover table-borderless">
                                                                         <tr><td>Username</td><td style="width:5px">:</td> </td><td><%=rs.getString("username")%></td></tr>
                                                                         <tr><td>Date Of Birth</td><td>:</td> </td><td><%=rs.getString("dob")%></td></tr>
                                                          		 <tr><td>Gender</td><td>:</td> </td><td><%=rs.getString("gender")%></td></tr>
                                                                         <tr><td>Caste</td><td>:</td></td><td><%=rs.getString("caste")%></td></tr>
                                                                         <tr><td>Religion</td><td>:</td><td><%=rs.getString("religion")%></td></tr>
                                                                         <tr><td>Occupation</td><td>:</td><td><%=rs.getString("occupation")%></td></tr>
                                                                         <tr><td>State</td><td>:</td><td><%=rs.getString("state")%></td></tr>
                                                                         <tr><td>Country</td><td>:</td><td><%=rs.getString("country")%></td></tr>
                                                                    </table>
								</div>
						    </div>
						    <div class="col-sm-12"><br><br></div>
						</div>
                                                                         <!--  ================================ Search profile start =================================== -->
						<div class="col-sm-4" style="padding-left:70px;">
							<div class="card w3-card">
								<div class="card-header">Looking For :</div>
								<div class="card-body">
                                                                    <form method="post" action="search.jsp">
									<label>Gender : </label>
                                                                        <select id="search_gender" class="form-control" name="gender">
									   <option value="Male">Male</option>
									   <option value="Female">Female</option>
                                                                        </select><br>
                                                                        <label>Caste : </label>
                                                                        <select  class="form-control"  id="search_caste" name="caste">
												<option value="Sharma">Sharma</option>
												<option value="Kumar">Kumar</option>
												<option value="Singh">Singh</option>
												<option value="Bansal">Bansal</option>
												<option value="Nai">Nai</option>
                                                                                                <option value="Gupta">Gupta</option>
                                                                                                <option value="Rajput">Rajput</option>
												<option value="Jain">jain</option>
												<option value="Bhati">Bhati</option>
												<option value="Rathore">Rathore</option>
												<option value="Solanki">Solanki</option>
												<option value="Jaat">Jaat</option>
												<option value="Gurjar">Gurjar</option>
												<option value="Muslim">Muslim</option>
												<option value="Kumawat">Kumawat</option>
												<option value="Saini">Saini</option>
												<option value="Godara">Godara</option>
												<option value="Sharan">Sharan</option>
												<option value="Sardar">Sardar</option>
												<option value="Bhaat">Bhaat</option>
												<option value="Swami">Swami</option>
												<option value="Goswami">Goswami</option>
												<option value="Banjara">Banjara</option>
												<option value="Tulyani">Tulyani</option>
											</select><br>			
                                                                        <label>Religion : </label>
                                                                        <select id="search_religion" class="form-control" name="religion">
                                                                                   <option value="Hindu">Hindu</option>
                                                                                   <option value="Islam">Islam</option>
                                                                                   <option value="Christian">Christian</option>
                                                                                   <option value="Sikh">Sikh</option>
                                                                                   <option value="Budhist">Budhist</option>
                                                                                   <option value="Other">Other</option>
                                                                             </select><br>
									<input type="submit" value="Search" class="btn btn-info">  
                                                                    </form>
									<br><br>
								</div>
							</div>
						</div>
					<!--  search profile end -->
					</div>
				</div>
			</div>
		</div>

		<!--  random profile -->
		 	<div class="row" id="matches">
			   <div class="col-sm-12"><br><center><h2>Profile Matches</h2></center><br></div>
			   <%
				Statement st1 = cn.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from user where email<>'"+email+"' ORDER by RAND() limit 0,4");
				while(rs1.next()){
					%>
			          	<div class="col-sm-3">
				     		<table class="table table-borderless w3-card">
					    		<tr><td align="center"><img style="width: 250px;height:250px;" src="profile/<%=rs1.getString("code")%>.jpg" class="img-fluid"></td></tr>
                                                        <tr><td align="center"><strong class="user" style="cursor:pointer"><a href="msg.jsp?code=<%=rs1.getString("code")%>"><%=rs1.getString("username")%></a></strong></td></tr>
							</table>
					  	</div>
			        <%		
				  }
				%>
			     <div class="col-sm-12"><br><br></div>
		   </div>
		<!-- end random profile -->
	</div>
</body>
</html>


<%
                        }
                        else{
                            response.sendRedirect("index.jsp?email_invalid=1");
                        }
                        cn.close();
                   }
                   catch(Exception ec){
                       out.println(ec.getMessage());
                   } 
            }
        }
        catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }  
%>

