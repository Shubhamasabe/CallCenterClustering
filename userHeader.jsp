<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnector.DbConnection"%>
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
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css" media="screen" />
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
</head>
<body>
<%

String name=session.getAttribute("mobile").toString();

%>
	<div class="body_wrapper">
		<div class="center">
			<div class="header_area">
				<div class="logo floatleft">
					<a href="userChatbotRegistration.jsp?Result="><img src="imgs/logo.png" alt="" /></a>
				</div>
				<div class="logo floatright" style="text-align: center;height: auto">
					<h3 style="font-size: 20px"><u><%=name %></u></h3>
				</div>
			</div>
			<div class="main_menu_area" style="margin-top: 10px">
				<ul id="nav">
					<li><a href="userChatbotRegistration.jsp?Result=">Home</a></li>
					<li><a href="./Logout?Result=user">Logout</a></li>
                </ul>
            </div>
           
		</div>
	</div>
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<script type="text/javascript">
selectnav('nav', {
    label: 'Menu',
    nested: true,
    indent: '>'
});

</script>

</body>
</html>