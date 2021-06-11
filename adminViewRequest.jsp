<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<link rel="stylesheet" type="text/css"
	href="assets/css/jquery.bxslider.css" media="screen" />
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>
	<div class="body_wrapper">
		<div class="center">
			<div class="container">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br/>
							<form action="adminViewRequest.jsp" method="post">
								<div class="pageform">
									<!-- <label style="color: #0084b4; text-align: center; margin-bottom: 7%">Select Department</label><br> -->
										<label>Select Department</label><br>
										<select name="dd_name">
										<%
										Connection con=DbConnection.getConnection();
										PreparedStatement ps=con.prepareStatement("SELECT * FROM `data_bank`");
										ResultSet rs=ps.executeQuery();
										while(rs.next())
										{
										%>
											<option value="<%=rs.getString("d_name") %>"><%=rs.getString("d_name") %></option>
										<%} %>
										</select>
										
										<br>
									<button type="submit">View Request</button>
								</div>
							</form>
							
							<br/>
							<hr/>
							
							<%
							if(request.getParameter("dd_name")!=null)
							{
								String dd_name=request.getParameter("dd_name");
								PreparedStatement ps1=con.prepareStatement("SELECT * FROM `all_request` where dept_name='"+dd_name+"' ORDER BY r_id DESC" );
								ResultSet rs1=ps1.executeQuery();
								%>
								<table class="table table-bordered">
									<tr>
										<th>Sr.No</th>
										<th>Message</th>
										<th>User Mobile Number</th>
										<th>Request Date</th>
									</tr>
								<%
								int ii=0;
								while(rs1.next())
								{
									++ii;
							%>
								<tr>
									
									<th><%=ii %></th>
									<td><%=rs1.getString("msg_request") %></td>
									<td><%=rs1.getString("user_id") %></td>
									<td><%=rs1.getString("c_date_time") %></td>
								
								</tr>
							<%} %>		
							</table>
							<%
							
							}
							%>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>