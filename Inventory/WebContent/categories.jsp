<%@page import="beans.DAO"%>
<%@page import="beans.DBImplementation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
							<li><a href="categories.jsp"><span>Categories</span></a></li>
							<li><a href="products.jsp"><span>Products</span></a></li>
							<li><a href="viewProducts.jsp"><span>View Products</span></a></li>
							<li><a href="logout.jsp"><span>Logout</span></a></li>
						</ul>
					</div>
				</div>


				<div class="content">
					<div class="row1">
		
						<div>
						
							<br>
							<div align="center">
							<h4></h4>
					
								<form method="post">
									<table>
										<tr>
											<th>Enter Categories:</th>
											<td>
												<input type="text" name="categoryname"
												id="textbox" value="" placeholder="Enter Category"><br>
											</td>
										</tr>
									 	<tr>
									 		<th></th>
									 		<td>
									 			<input type="submit" value="Add Category" id="submit" name="submit">
												</td>
									 	</tr>
									</table>
								</form>
							</div>
							<br> <br>
						</div>
						<%
int rows;
DAO dao = new DBImplementation();				
if (request.getParameter("submit") != null) {
String Categoryname = request.getParameter("categoryname");

String query = "insert into category (CategoryName) value('"+Categoryname+"')";
rows = dao.putData(query);
if (rows>0) 
{
response.sendRedirect("categories.jsp");
}	
else
{
	%>
	<script type="text/javascript">
		alert("Failed to add category");
	</script>
	<%
	response.sendRedirect("categories.jsp");
}
}
%>
					</div>
				</div>
			</div>
			<div class="footer"></div>
		</div>
	</div>
</body>
</html>