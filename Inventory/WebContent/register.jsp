<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="beans.DAO"%>
<%@page import="beans.DBImplementation"%>
<%@page import="java.sql.ResultSet"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Management System</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="page-in">
		<div class="page">
			<div class="main">
				<div class="header">
					<div class="header-top">
						<h1>
							Inventory <span>Management System</span>
						</h1>
					</div>

					<div class="topmenu">
						<ul>
							<li
								style="background: transparent none repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; padding-left: 0px;"><a
								href="register.jsp"><span>Register</span></a></li>
							<li><a href="login.jsp"><span>Login</span></a></li>
						</ul>
					</div>
				</div>


				<div class="content">
					<div class="content-left">
						<div class="row1">
							<h1 class="title">
								Welcome To <span>Invetory Managemnt</span>
							</h1>
							<div align="center">
								<img src="images/img.png" alt="#" border="0">
								<h1>Register Here</h1>
								
				
								<form method="post">
									<table>
										<tr>
											<td><label>Enter Name:</label></td>
											<td><input type="text" placeholder="Enter Name "
												name="name" id="name"></td>
										</tr>
										<tr>
											<td><label>Enter MailId:</label></td>
											<td><input type="text" placeholder="Enter MailId "
												name="mailid" id="mailid"></td>
										</tr>
										<tr>
											<td><label>Password:</label></td>
											<td><input type="password" placeholder="Enter password "
												name="password" id="password"></td>
										</tr>
										<tr>
											<td><label> Mobile Number:</label></td>
											<td><input type="number" placeholder="Enter Mobile Number "
												name="mobnum" id="mobnum"></td>
										</tr>
										<tr>
											<td><label>Address:</label></td>
											<td><input type="text" placeholder="Enter Address "
												name="address" id="address"></td>
										</tr>
										
										<tr>
											<td><label>Amount:</label></td>
											<td><input type="number" placeholder="Enter Amount "
												name="amount" id="amount"></td>
										</tr>
									</table>
									<br> <input type="submit" value="Register" id="Register" name="Register">
								</form>
							</div>
						</div>
					</div>
					<%
int rows;
DAO dao = new DBImplementation();				
if (request.getParameter("Register") != null) {
String username = request.getParameter("name");
String usermail = request.getParameter("mailid");
String password = request.getParameter("password");
String usermobileno = request.getParameter("mobnum");
String useraddress = request.getParameter("address");
double amount = Double.parseDouble(request.getParameter("amount"));
String query = "insert into user_tbl (UserName,MailID,Password,MobileNumber,Address,ammount) value('"+username+"','"+usermail+"','"+password+"','"+usermobileno+"','"+useraddress+"',"+amount+")";
rows = dao.putData(query);
if (rows>0) 
{
response.sendRedirect("login.jsp");
}	
else
{
	%>
	<script type="text/javascript">
		alert("Failed to Register");
	</script>
	<%
	response.sendRedirect("register.jsp");
}
}
%>
					
					<div class="contact">
						<h2 class="sidebar2">Contact</h2>
						<div class="contact-detail">
							<p class="green">
								<strong>Welcome to Inventory Management System</strong>
							</p>
							<p>
								<strong>E-mail :</strong> &nbsp;&nbsp;&nbsp;inventory@gmail.com
							</p>
							
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<p>
				Inventory Management System
				</p>
			</div>
		</div>
	</div>

</body>
</html>