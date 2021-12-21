<%-- 
    Document   : msg
    Created on : 16 Nov, 2021, 9:34:17 AM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
                if(request.getParameter("code")!=null){
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        String code = request.getParameter("code");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from user where code='"+code+"'");
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
                      <a class="nav-link"  href="view_profile.jsp">View Profile</a>
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
		<div class="row" id="main-block" style="background-image:url(image/pink.jpg);height:auto">
			<div class="col-sm-12">
				<div class="container">
                                    <div class="breadcrumb1">
                                        <ul>
                                           <a href="index.jsp"><i class="fa fa-home home_1"></i></a>
                                           <span class="divider">&nbsp;|&nbsp;</span>
                                           <li class="current-page">Other Profiles</li>
                                        </ul>
                                      </div>
				   <div class="row" style="margin-top:100px">
						<div class="col-sm-8">
                                                    <%
                                                        if(request.getParameter("success")!=null){
                                                            out.println("<h3 class='alert alert-success'>Password Updated Successfully !</h3>");
                                                        }
                                                        else if(request.getParameter("empty")!=null){
                                                            out.println("<h3 class='alert alert-warning'>All Field Required !</h3>");
                                                        }
                                                        else if(request.getParameter("again")!=null){
                                                            out.println("<h3 class='alert alert-danger'>Try Again !</h3>");
                                                        }
                                                        else if(request.getParameter("invalid_pass")!=null){
                                                            out.println("<h3 class='alert alert-danger'>Current Password Not Matched !</h3>");
                                                        }
                                                        else if(request.getParameter("miss_match")!=null){
                                                            out.println("<h3 class='alert alert-warning'>New Password or Retype Password Not Matched !</h3>");
                                                        }
                                                    %>
                                                    <div class="row w3-card-4"  style="background-color:white" id="user">
							    <div class="col-sm-12"><br><br></div>
								<div class="col-sm-4">                                
								    <img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid">
								</div>
								<div class="col-sm-8">
                                                                    <form method="post" action='send_msg.jsp?code=<%=rs.getString("code")%>'>
								     <table class="table table-borderless">
                                                                         <tr><td>Username</td><td style="width:5px">:</td> </td><td><%=rs.getString("username")%></td></tr>
                                                                         <tr><td>Date Of Birth</td><td>:</td> </td><td><%=rs.getString("dob")%></td></tr>
                                                          		 <tr><td>Gender</td><td>:</td> </td><td><%=rs.getString("gender")%></td></tr>
                                                                         <tr><td>Caste</td><td>:</td></td><td><%=rs.getString("caste")%></td></tr>
                                                                         <tr><td>Religion</td><td>:</td><td><%=rs.getString("religion")%></td></tr>
                                                                         <tr><td>Occupation</td><td>:</td><td><%=rs.getString("occupation")%></td></tr>
                                                                         <tr><td>State</td><td>:</td><td><%=rs.getString("state")%></td></tr>
                                                                         <tr><td>Country</td><td>:</td><td><%=rs.getString("country")%></td></tr>
                                                                         <tr><td>Message</td><td>:</td><td><textarea type="text" name="msg" class='form-control'></textarea></td></tr>
                                                                         <tr><td><input type='submit' value="Send" class="btn btn-danger"></td></tr>
                                                                     </table>
                                                                    </form>
								</div>
						    </div>
						</div>
                                       <div class="col-sm-12"><br><br></div>
					</div>
				</div>
			</div>
		</div>

		<!--  random profile -->
		 	<div class="row" id="matches">
			   <div class="col-sm-12"><br><center><h2>Profile Matches</h2></center><br></div>
			   <%
                            try{
				Statement st1 = cn.createStatement();
                                ResultSet rs1 = st1.executeQuery("select * from user where email<>'"+email+"' ORDER by RAND() limit 0,4");
				while(rs1.next()){
					%>
			          	<div class="col-sm-3">
				     		<table class="table table-borderless w3-card">
					    		<tr><td align="center"><img style="width: 250px;height:250px;" src="profile/<%=rs1.getString("code")%>.jpg" class="img-fluid"></td></tr>
							<tr><td align="center"><strong class="user" style="cursor:pointer"><a href='msg.jsp?code=<%=rs1.getString("code")%>'><%=rs1.getString("username")%></a></strong></td></tr>
							</table>
					  	</div>
		        <%		
				  }
                                cn.close();
                            }
                            catch(Exception ec){
                                out.println(ec.getMessage());
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
                else{
                    response.sendRedirect("view_profile.jsp");
                }
            }
        }
        catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }  
%>