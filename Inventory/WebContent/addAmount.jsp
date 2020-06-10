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
<%
int uid=Integer.parseInt(session.getAttribute("UserID").toString());
%> 
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
								href="buyProducts.jsp"><span>Buy Products</span></a></li>
							<li
								style="background: transparent none repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; padding-left: 0px;"><a
								href="logout.jsp"><span>Logout</span></a></li>
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
								<h1>Add Wallet Amount</h1>


								<form method="post">
									<table>
										<tr>
											<td><label>Add Amount</label></td>
											<td><input type="number" placeholder="Add Amount "
												name="amount" id="amount"></td>
										</tr>
									</table>
									<br> <input type="submit" value="Add Amount" id="submit"
										name="submit">
								</form>
							</div>
						</div>
					</div>
					<%
						DAO dao = new DBImplementation();
						
						if (request.getParameter("submit") != null) {
							double amount = Double.parseDouble(request.getParameter("amount"));
							String query = "update user_tbl set ammount=ammount+"+amount+" where UserID="+uid;
							System.out.println(query);
							int r = dao.putData(query);
						} else {
					%>
					<script type="text/javascript">
						alert("Failed To Add Amount");
					</script>
					<%
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