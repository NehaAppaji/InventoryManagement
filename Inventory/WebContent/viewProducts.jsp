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
<%int id=0; %>
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
							<li><a href="viewProducts.jsp"><span>View
										Products</span></a></li>
							<li><a href="logout.jsp"><span>Logout</span></a></li>
						</ul>
					</div>
				</div>


				<div class="content">
					<div class="row1">

						<div>

							<br>
							<div align="center">
								<h2 style="font-weight: bold;">Products</h2>
								<span class="byline" style="font-weight: bold;">Details
								</span>
								</header>
								<%
									DAO dao=new DBImplementation();
								%>
								<table style="width: 80%; margin-left: 100px;">
									<tr>
										<th style="font-size: 25px;">ProductName</th>
										<th style="font-size: 25px;">Quantity</th>
										<th style="font-size: 25px;">Original Price</th>
										<th style="font-size: 25px;">Selling Price</th>
										<th>Edit / Delete</th>
									</tr>
									<%
										String query="select * from product_tbl";
									ResultSet result=dao.getData(query);
											while(result.next()){
												 id=result.getInt("ProductID");
												String pname=result.getString("ProductName");
												double sprice=result.getDouble("ProductSellingprice");
												double oprice=result.getDouble("ProductCostprice");
												double quantity=result.getDouble("ProductQuantity");
									%>
									<tr>
										<td><%=pname%></td>
										<td><%=sprice%></td>
										<td><%=oprice%></td>
										<td><%=quantity%></td>
										<td>
										<a href="products.jsp?editId=<%=id%>">Edit
										</a> <a href="viewProducts.jsp?deleteId=<%=id%>"
											onclick="return onDelete();">Delete </a>
									</td>
									</tr>
									<%
										}
									%>
								</table>
								<%
								if (request.getParameter("deleteId") != null) {
								String query1="delete from product_tbl where ProductId="+request.getParameter("deleteId");
								System.out.println(query1);
								int r=dao.putData(query1);
								if(r>0)
								{
									System.out.println("yes");
								}
								}
								%>
							</div>

							
						</div>
						<br> <br>
					</div>

				</div>
			</div>
		</div>
		<div class="footer"></div>
	</div>
	</div>
</body>
</html>