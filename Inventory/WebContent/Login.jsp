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
								<h1>Login Here</h1>


								<form method="post">
									<table>
										<tr>
											<td><label>Enter MailId:</label></td>
											<td><input type="text" placeholder="Enter MailId "
												name="email" id="email"></td>
										</tr>
										<tr>
											<td><label>Password:</label></td>
											<td><input type="password" placeholder="Enter password "
												name="password" id="password"></td>
										</tr>
									</table>
									<br> <input type="submit" value="Login" id="login"
										name="submit">
								</form>
							</div>
						</div>
					</div>
					<%
						DAO dao = new DBImplementation();
						String username = "", password = "";

						if (request.getParameter("submit") != null) {
							username = request.getParameter("email");
							password = request.getParameter("password");
							String query = "SELECT * FROM admin_tbl where adminMailID = '" + username + "' and adminPassword = '"
									+ password + "'";

							ResultSet resultSet = dao.getData(query);
							if (resultSet.next()) {
								session.setAttribute("admin", username);
								response.sendRedirect("categories.jsp");
							}

							else {
								String sql = "select * from user_tbl where MailId = '" + username + "' and Password='" + password
										+ "'";
								System.out.print(sql);
								resultSet = dao.getData(sql);
								if (resultSet.next()) {
									int sid = resultSet.getInt("UserID");
									session.setAttribute("UserID", String.valueOf(sid));
									response.sendRedirect("buyProducts.jsp");
								} else {
					%>
					<script type="text/javascript">
						alert("Invalid Username and Password ");
					</script>
					<%
						}

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
				<p>Inventory Management System</p>
			</div>
		</div>
	</div>

</body>
</html>