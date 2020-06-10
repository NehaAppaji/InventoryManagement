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
								<h1>Buy Products</h1>
<%
									DAO dao=new DBImplementation();
int id=0;
int uid=Integer.parseInt(session.getAttribute("UserID").toString());

								%>
								
								<table style="width: 80%; margin-left: 100px;">
									<tr>
										<th style="font-size: 25px;">ProductName</th>
										<th style="font-size: 25px;">Quantity</th>
										<th style="font-size: 25px;">Selling Price</th>
										<th>Buy Product</th>
										
									</tr>
									<%
										String query="select * from product_tbl";
									double sprice=0;
									ResultSet result=dao.getData(query);
											while(result.next()){
												 id=result.getInt("ProductID");
												String pname=result.getString("ProductName");
												 sprice=result.getDouble("ProductSellingprice");
												double quantity=result.getDouble("ProductQuantity");
									%>
									<tr>
										<td><%=pname%></td>
										<td><%=sprice%></td>
										<td><%=quantity%></td>
										<td>
										<a href="buyProducts.jsp?buyId=<%=id%>">Buy Product
										</a> 
									</td>
									</tr>
									<%
										}
									%>
								</table>
<%
double balance=0;
String checkAmount="select ammount from user_tbl where UserId="+uid;
result=dao.getData(checkAmount);
if(result.next())
{
 balance=result.getDouble("ammount");
}
								if(balance>sprice)
								{
								if (request.getParameter("buyId") != null) {
								String query1="insert into  transaction_tbl (ProductID,payment,UserId)values("+id+","+sprice+","+uid+")";
								System.out.println(query1);
								int r=dao.putData(query1);
								if(r>0)
								{
									balance=balance-sprice;
									String q1="update user_tbl set ammount="+balance+" where UserId="+uid;
									System.out.println(q1);
									int r1=dao.putData(q1);
									if(r1>0){
										System.out.println("Buy Products");
									}
								}
								}
								}
								else
								{
									%>
									<script type="text/javascript">
									alert("Insufficient Amount");
									window.location.href=("addAmount.jsp");
									</script>
								<%
								}
								%>
								
								
								
							</div>
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