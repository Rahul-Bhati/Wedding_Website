<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>
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
	<script src="https://use.fontawesome.com/09901d9403.js"></script>
        <style>
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
				<a class="nav-link" href="index.jsp">Home</a>
			  </li>
			  <li class="nav-item">
			  <a class="nav-link" href="login.jsp">Login</a>
			</li>
                        <li class="nav-item">
                            <a class="nav-link"  href="register.jsp">Register</a>
			</li>
			  <li class="nav-item">
				<a class="nav-link" href="#">Contact</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="#">About us</a>
			  </li>	 
			</ul>
                     <!-- <form class="form-inline mr-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                      </form -->
		  </div>  
	</nav>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="image/1.jpg" class="img-fluid" alt="marrige">
              </div>
              <div class="carousel-item">
                <img src="image/2.jpg" class="img-fluid" alt="marrige">
              </div>
              <div class="carousel-item">
                <img src="image/3.jpg" class="img-fluid" alt="marrige">
              </div> 
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
         </div><br><br>
        <div class="container-fluid">
			<div class="row">
				<div class="col-sm-12"><center><h3 style="color:red;font-size:30px;font-family: Georgia, serif;"><b>Find your Special Someone</b></h3></center></div>
			</div><br><br>
			<div class="row">
				<div class="col-sm-4">
					<a href="login.jsp"><center><i class="fa fa-user-circle" style="font-size:100px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>Sign-Up</b></h4></center></a><p><center>Register for free & put up your Matrimony Profile</center></p>
				</div>
				<div class="col-sm-4">
					<a href=""><center><i class="fa fa-handshake-o" style="font-size:100px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>Connect</b></h4></center></a><p><center>Select & Connect with Matches you like</center></p>
				</div>
				<div class="col-sm-4">
					<a href=""><center><i class="fa fa-comments-o" style="font-size:100px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>Interact</b></h4></center></a><p><center>Become a Premium Member & Start a Conversation</center></p>
				</div>
			</div><br><br>
			<div class="row" style="background-color:#afeeee">
				<div class="col-sm-12"><center><h3 style="color:#cd5c5c;font-size:40px;font-family:system-ui;padding-top:25px;">Introducing Shaadi Meet!</h3></center></div>
				<br><br><br>
				<div class="col-sm-6">
					<img src="couple-logo.png" class="img-fluid" style="padding-top:50px; margin-left:320px;">
				</div>
				<div class="col-sm-6">
					<img src="meet.svg" class="img-fluid" style="padding-top:50px; margin-left:100px;">
					<h3 style="margin-left:80px;font-family:raleway;font-size:30px;">Now meet your Matches over </h3>
					<h3 style="margin-left:180px;font-family:raleway;font-size:30px;">video call</h3><br>
					<h3 style="margin-left:75px;border-bottom: 2px solid #000;width:25rem;" ></h3>
				</div>
			</div><br><br><br>
			<div class="row">
				<div class="col-sm-12">
					<center><h2 style="color:#dc143c;font-family:josefin-sans;font-size:40px;">Matrimony Service with Millions of Success Stories</h2></center>
				</div>
			</div><br><br><br>
                        <div class="row" style="margin-left:100px;">
                            <%
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                                    Statement st = cn.createStatement();
                                    ResultSet rs = st.executeQuery("select * from story ORDER by RAND() limit 0,3");
                                    while(rs.next()){
                                        %>
                                            <div class="col-sm-4">
                                                    <div class="w3-card-4" style="width:20rem;">
                                                            <div class="card-body">
                                                                    <table class="table table-borderless">
                                                                            <tr><td><img class="card-img-top" src="story/<%=rs.getString("code")%>.jpg" style="width:250px;height:250px;" alt="Card image"></td></tr>
                                                                            <tr><td>
                                                                                    <h4 class="card-title"><%=rs.getString("couplename")%></h4>
                                                                                    <p class="card-text"><%=rs.getString("story")%></p>
                                                                            </td></tr>
                                                                    </table>
                                                            </div>
                                                    </div>
                                            </div>
                                        <%
                                    }
                                }
                                catch(Exception e){
                                    out.println(e.getMessage());
                                }
                             %>
				<!--<div class="col-sm-4">
					<div class="w3-card-4" style="width:20rem;margin-left:200px;">
						<div class="card-body">
							<table class="table table-borderless">
								<tr><td><img class="card-img-top" src="story/1.jpg" alt="Card image"></td></tr>
								<tr><td>
									<h4 class="card-title">Radhika & Pranav</h4>
									<p class="card-text">We saw each other's profile on Vivah.com in the month of july 2019. 
                                                                            We started chatting on this platform and we both started liking each other.
                                                                            We did our engagement on 30th of January 2020 but unfortunately due to pandemic we couldn't be able to get married on the same year.
                                                                            It was like god is taking our exam.</p>
								</td></tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="w3-card-4" style="width:20rem;margin-left:100px;">
						<div class="card-body">
						<table class="table table-borderless">
							<tr><td><img class="card-img-top" src="story/1.jpg" alt="Card image"></td></tr>
							<tr><td>
								<h4 class="card-title">Vikash & Krishma</h4>
								<p class="card-text">Finally after looking so many profiles I found my match. 
                                                                    All I would say that good things takes time, so guys don't loose your patience you will get your special someone.
                                                                    "Vivah.com Team congratulates Shubham & Isha. We wish you both a happy future. 
                                                                    Thanks for visiting our site god bless both of you."</p>
							</td></tr>
						</table>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="w3-card-4" style="width:20rem;">
						<div class="card-body">
						<table class="table table-borderless">
							<tr><td><img class="card-img-top" src="story/1.jpg" alt="Card image"></td></tr>
							<tr><td>
								<h4 class="card-title">Neha & Arnab</h4>
								<p class="card-text">Arnab and I met through Vivah.com and found each other compatible in all possible aspects
                                                                    and soon realized that there couldn't be any one else than him as my life partner. 
                                                                    All I want to convey to the readers that just keep looking out for your match without losing hope and getting disheartened. 
                                                                    and god bless both of you.</p>
							</td></tr>
						</table>
						</div>
					</div>
				</div> -->
			</div><br><br><br>
			<div class="row"style="background-color:#dc143c;">
				<div class="col-sm-12" style="padding-top:20px;padding-bottom:20px;"><center><h4 style="color:white;font-family:raleway;">Your story is waiting to happen! &nbsp;<button class="btn btn-danger" style="border:2px solid #fff;font-size:20px;cursor:pointer;"><a href="login.jsp">Get Started</a></button></h4></center></div>
			</div><br><br><br>
			<div class="row">
				<div class="col-sm-12"><center><h3 style="font-size:40px;color:#dc143c;">Search by Popular Matrimony Sites</h3></center></div>
			</div><br><br><br>
			<div class="row">
				<div class="col-sm-4">
					<center><h4 style="border-bottom: 2px solid #000;width:20rem;">By Mother Tongue</h4><p>Bengali | Gujarati |Hindi |Kannada |Malayalam |Marathi |Odia |Punjabi |Sindhi |Tamil |Telugu</p></center>
				</div>
				<div class="col-sm-4">
					<center><h4 style="border-bottom: 2px solid #000;width:20rem;">By Religion</h4><p>Buddhist |Christian |Jain |Muslim |Hinddu |Sikh</p></center>
				</div>
				<div class="col-sm-4">
					<center><h4 style="border-bottom: 2px solid #000;width:20rem;">By Community</h4><p>Adi Dravida |Arya Vysya |Brahmin |Ezhava |Iyer |Kamma |Maratha |Nadar |Nair |Reddy |Vokkaliga |Yadav</p></center>
				</div>
			</div><br><br><br>
			<div class="row">
				<div class="col-sm-12"><center><h2><b>Vivah.com</b></h2></center><br>
				<p style="margin-left:30px;">Vivah.com, India’s No.1 Matchmaking and Matrimony Service, was founded with a simple objective - to help people find happiness. Shaadi.com is a leader in what is sometimes known as the matrimony category, we have touched more than 35 million lives.<br><br>
				Vivah.com - a trusted matrimonial & matchmaking service, has always differentiated itself from other matrimonials through its innovation-led approach by redefining the way Indian brides and grooms meet for marriage.<br><br>
					We have also created trusted and renowned community specific matrimony platforms such as TamilShaadi.com, TeluguShaadi.com, MalayaleeShaadi.com, KannadaShaadi.com, BengaliShaadi.com, GujaratiShaadi.com, MarathiShaadi.com, PunjabiShaadi.com and more that has changed the way of finding a life partner.</p></div>
			</div><br><br><br>
			<div class="row">
				<div class="col-sm-12"><center><h2><span style="background-color:#008b8b;padding:5px;border-bottom: 2px solid #000;">Trusted by Millions</span></h2><center></div>
			</div>
			<div class="row">
				<div class="col-sm-12"><center><h3 style="border-bottom: 1px solid #000; width:50rem;"></h3></center></div>
			</div>
			<div class="row">
				<div  style="margin-left:300px;">
					<center><i class="fa fa-users" style="font-size:30px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>Best Matches</b></h4></center>
				</div>
				<div  style="margin-left:261px;">
					<center><i class="fa fa-address-card-o" style="font-size:30px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>Verified Profiles</b></h4></center>
				</div>
				<div  style="margin-left:262px;">
					<center><i class="fa fa-shield" style="font-size:30px;color:#008b8b;" aria-hidden="true"></i><h4 style="color:#6495ed;"><b>100% Privacy</b></h4></center>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12"><center><h3 style="border-bottom: 1px solid #000; width:50rem;"></h3></center></div>
			</div><br><br><br>
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
			</div><br><br>
			<div class="row" style="background-color:#dcdcdc;">
				<div class="col-sm-6" style="padding:20px;">
					<div style="margin-left:40px;">
						<h3>Follow us on:</h3>
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
