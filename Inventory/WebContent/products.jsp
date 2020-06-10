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
							<li><a href="categories.jsp"><span>Add Categories</span></a></li>
							<li><a href="products.jsp"><span>Add Products</span></a></li>
							<li><a href="viewProducts.jsp"><span>View Products</span></a></li>
							<li><a href="logout.jsp"><span>Logout</span></a></li>
						</ul>
					</div>
				</div>


				<div class="content">
					<div class="row1">
						<h1 class="title">Manage Products</h1>
						<div>

							<br>
							<div align="center">

								<form action="#" method="post"
									>

									<table>
										<tr>
											<th>Category</th>
											<td><select class="form-control" name="categoryId" id="categoryId">
													<%
														int catID = 0;
														DBImplementation dao = new DBImplementation();
														ResultSet resultSet;
														String query = "select * from category";
														resultSet = dao.getData(query);
														int id=0;
														while (resultSet.next()) {
															String categoryname = resultSet.getString("CategoryName");
															catID = resultSet.getInt("CategoryID");
													%>
													<option value="<%=catID%>"><%=categoryname%></option>
													<%
														}
													%>
											</select></td>
										</tr>
										<tr>
											<th>Product</th>
											<td><input type="hidden" name="productId" id="productId"
												value="">
												<input type="text" name="productName" id="productName"
												value=""><br></td>
										</tr>
										<tr>
											<th>Quantity</th>
											<td><input type="text" name="quantity" id="quantity"
												value=""><br></td>
										</tr>
										<tr>
											<th>Selling Price</th>
											<td><input type="text" name="sprice" id="sprice"
												value=""><br></td>
										</tr>
<tr>
											<th>Price</th>
											<td><input type="text" name="cprice" id="cprice"
												value=""><br></td>
										</tr>
										<tr>
											<th></th>
											<td><input type="submit" value="Submit" id="login"
												name="submit"></td>
										</tr>
									</table>
								</form>
							</div>
							<br> <br>
						</div>
						<%
							int rows;
							dao= new DBImplementation();
							if (request.getParameter("submit") != null) {							
								if(request.getParameter("submit").equalsIgnoreCase("Update"))
								{
									String q1="update product_tbl set ProductName='"+request.getParameter("productName")+"', ProductCostprice="+request.getParameter("cprice")+" , ProductSellingPrice="+request.getParameter("sprice")+", ProductQuantity="+request.getParameter("quantity")+" where ProductId="+request.getParameter("productId");
									System.out.println(q1);
									int r=dao.putData(q1);
									if(r>0)
									{
										%>
										<script type="text/javascript">
										alert("Data Updated Successfully");
										window.location.href="viewProducts.jsp";
									</script>
									<%}
									else
									{
										%>
										<script type="text/javascript">
										alert("Failed To Update");
									</script>
									<%
									}
								}
								else
								{
								String productname = request.getParameter("productName");
								String productcostprice = request.getParameter("cprice");
								String productsellingprice = request.getParameter("sprice");
								String productquantity = request.getParameter("quantity");
								catID=Integer.parseInt(request.getParameter("categoryId"));

								String query1 = "insert into product_tbl (ProductName,ProductCostprice,ProductSellingprice,ProductQuantity,CategoryID) value('"
										+ productname + "' , " + productcostprice + " , " + productsellingprice + " , '"
										+ productquantity + "'," + catID + ")";
								rows = dao.putData(query1);
								if (rows > 0) {
									System.out.println("Product added successfully");
									//response.sendRedirect("AddProduct.jsp");
								} else {
						%>
						<script type="text/javascript">
							alert("Failed to add product");
						</script>
						<%
							response.sendRedirect("products.jsp");
								}
							}
							}
								if (request.getParameter("editId") != null) {
							
								String query1="select * from product_tbl where ProductID="+request.getParameter("editId");
								System.out.println(query1);
								ResultSet result=dao.getData(query1);
								if(result.next())
								{
							%>
							<script type="text/javascript">
									document.getElementById("productName").value="<%=result.getString("ProductName")%>";
									document.getElementById("cprice").value="<%=result.getDouble("ProductCostprice")%>";
									document.getElementById("sprice").value="<%=result.getDouble("ProductSellingprice")%>";
									document.getElementById("quantity").value="<%=result.getDouble("ProductQuantity")%>";
									document.getElementById("productId").value="<%=result.getInt("ProductID")%>";
									document.getElementById("login").value="Update";
									
						</script>
							<%
								}
								}
							
							%>
						
						</div>
					</div>
				</div>
			</div>
			<div class="footer"></div>
		</div>
	</div>
</body>
</html>