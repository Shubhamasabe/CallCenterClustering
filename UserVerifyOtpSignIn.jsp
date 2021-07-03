<%@page import="controller.GlobalFunction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>Call Center Voice Clustering</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="assets/font/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="assets/font/font.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="assets/css/jquery.bxslider.css" media="screen" />
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>

</head>
<body>
	<div class="body_wrapper">
		<div class="center">
			<div class="header_area">
				<div class="logo floatleft">
					<a href="index.jsp"><img src="imgs/logo.png" alt="" /></a>
				</div>
			</div>
			<div class="main_menu_area" style="margin-top: 10px">
				<ul id="nav">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="UserSignIn.jsp?Result=">User</a></li>
					<li><a href="AdminSignIn.jsp?Result=">Admin</a></li>

				</ul>
			</div>
			
			
			
			<div class="container">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div
							class="col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
							<form action="VerifySignInOTP" method="post" name="ureg">
								<div class="pageform">
									<label style="color: #0084b4; text-align: center; margin-bottom: 7%">
									User Login</label><br> 
									<label>Mobile Number</label><br>
									<input type="text" name="mobile" value="<%=session.getAttribute("mobile").toString() %>" readonly="readonly"><br>
									<label>Enter OTP</label><br>
									<input type="text" name="otp" required="required"><br>
									
									<button type="submit">Start Conversion</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="assets/js/jquery-min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
	<script type="text/javascript">
		selectnav('nav', {
			label : 'Menu',
			nested : true,
			indent : '>'
		});
	</script>

</body>
</html>