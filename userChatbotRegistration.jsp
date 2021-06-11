<%@page import="javax.sound.sampled.ReverbType"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnector.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>Call Center Voice Clustering</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />


<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css" media="screen" />

<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>


<!-- user_details -->


<style>
         blink {
           color:#82e0aa;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 
          @-webkit-keyframes blink {
          67% { opacity: 0 }
         }
 
         @keyframes blink {
         67% { opacity: 0 }
        }
 </style>


<style>
.speech {
	border: 1px solid #DDD;
	width: 360px;
	padding: 0;
	margin: 0
}

.speech textarea {
	border: 0;
	width: 350px;
	display: inline-block;
	height: 70px;
}

/* .speech img new Voicemsg {
	float: right;
	width: 40px
} */
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="css/nivo-lightbox.css" rel="stylesheet" />
<link href="css/nivo-lightbox-theme/default/default.css"
	rel="stylesheet" type="text/css" />
<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
<link href="css/owl.theme.css" rel="stylesheet" media="screen" />
<link href="css/animate.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet">
<link href="color/default.css" rel="stylesheet">

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
<body id="page-top" data-spy="scroll" data-target=".navbar-custom"
	onkeydown="CheckKey()">

	<jsp:include page="userHeader.jsp"></jsp:include>
	<%
	
	response.setHeader("Pragma","no-cache"); // HTTP 1.0
	response.setHeader("Cache-Control","no-store"); // HTTP 1.1
	response.setDateHeader("Expires", 0);
	String name=session.getAttribute("mobile").toString();
	if(name==null)
	{
		response.sendRedirect("UserSignIn.jsp?Result=");	
	}
	else
	{
	    String conversion="";
        conversion=(String)session.getAttribute("questionanswer");
        if(conversion==null)
        	conversion="";
       
       // System.out.println(conversion);
%>
	<div class="body_wrapper">
		<div class="center">


			<div class="container">
	
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
					
						<div
							class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="pageform">
							<form action="CarClassifications" method="post" id="labnol">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<label style="color: red"><%=name %> : </label><br>
										<input type="hidden" value="<%=conversion%>" name="conversion">
										
										<textarea rows="5" cols="40" placeholder="Speak"
										name="search" id="transcript" onblur="return getData()"></textarea>
										
																		
									<!-- <input type="search" name="search" id="transcript" onblur="return getData()" placeholder="Keyword" required="required" style="height: 35px;width:80%;margin:0"> -->
									<button type="submit" style="height: 50px;width:70px;margin:0;padding: 0">Ask</button>
									</div>
									
							</form>
								
								<%
                              
                              if(!conversion.equals(""))  
                              {
                            	  //System.out.println("hello");
                         %>
                         <br>
								<br>
                        <div class="table-responsive" >          
                        <table style="overflow-y:auto;" class="table " style="text-align: center;width: auto;margin: 0;border: 1px solid #fff;color: #fff">
                        <thead>
                        <%
                        String []quesanswers=conversion.split("@");
                        int size=quesanswers.length-1;
                        System.out.println("size is "+size);
                        //for(String quesanswer:L  quesanswers)
                       	for(int i=size;i>0;i--)
                        {
                       		
                       	String quesanswer=quesanswers[i];
                        String []onequesans=quesanswer.split("#");	
                        String question="";
                        String answer="";
                        question=name+":"+onequesans[0];
                        answer="Chatbot : "+onequesans[1];
                        
                        String []answer_a_id=onequesans[1].split("_");
                        answer="Chatbot : "+answer_a_id[0];
                        String a_id=answer_a_id[1];
                        
                       
                        %>
                        <tr>
						<td style="height: auto;width: auto;border: 1px solid;border-radius: 10px;background: #34495e;"><div class="talk-bubble"><label style="color: white;"><%=question%> </label></div></td>
						<td style="width: 20%"></td>
						<td></td>
						</tr>
						<tr>
						<td></td>
						<td></td>
						
						<td style="height: auto;width: auto;border: 1px solid;border-radius: 10px;background: #82e0aa;"><label style="color: white"> <%=answer %> </label>
						</td>
					    </tr>
						<%
						//System.out.println(answer);
                         }
                        %>
						</thead>
						</table>
						</div>
						<%
                                }
                              else
                              {
                            	  String defaultmsg="hi i'm Chatbot";
                            	  %>
                            	  <br>
								<br>
                            	
						        <blink>Hi User I'm Chatbot  <br></br>
						         Ask questions <br>
		        		         </blink>
					    
                            	 <% 
                              }
						%>
                                 
									
								
								
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%
	
	}
	
%>


	<script>
		function getData() {
			var text = document.ureg.requirment.value;
		//	alert(text);
			window.location = "FromUserData?requirment="+text;

		}
	</script>
	<!-- HTML5 Speech Recognition API -->
	<script>
		function CheckKey() {
			if (event.keyCode === 13) {
				event.preventDefault();
				startDictation();
			}
		}
		function startDictation() {

			if (window.hasOwnProperty('webkitSpeechRecognition')
					|| window.hasOwnProperty('SpeechRecognition')) {

				var recognition = new webkitSpeechRecognition()
						|| new SpeechRecognition();

				recognition.continuous = false;
				recognition.interimResults = false;

				recognition.lang = "en-US";
				recognition.start();

				recognition.onresult = function(e) {
					console.log(e.results);
					document.getElementById('transcript').value = e.results[0][0].transcript;
					recognition.stop();
					//   document.getElementById('labnol').submit();
				};

				recognition.onerror = function(e) {
					recognition.stop();
				}

			}
		}
	</script>


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