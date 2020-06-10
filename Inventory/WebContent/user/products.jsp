<%@page import="beans.DAO"%>
<%@page import="beans.DBImplementation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<style>
body{
  font-family: 'Open Sans', sans-serif;
  background:#3498db;
  margin: 0 auto 0 auto;  
  width:100%; 
  text-align:center;
  margin: 20px 0px 20px 0px;   
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
}

.box{
  background:white;
  width:300px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 70px 0px;
  border: #2980b9 4px solid; 
}

.email{
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:#AAAAAA;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  border-radius:4px;
  background:#ecf0f1;
  border: #ccc 1px solid;
  padding: 8px;
  width:250px;
  font-size:1em;
}

.btn{
  background:#2ecc71;
  width:125px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27ae60 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  float:left;
  margin-left:16px;
  font-weight:800;
  font-size:0.8em;
  
}

.btn:hover{
  background:#2CC06B; 
}

#btn2{
  float:left;
  background:#3498db;
  width:125px;  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #2980b9 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  margin-left:10px;
  font-weight:800;
  font-size:0.8em;
}

#btn2:hover{ 
background:#3594D2; 
}

table{
border-top: 1px solid #ff0000;
border-left: 1px solid #ff0000;
}
table td{
border-right:1px solid #00ff00;
border-bottom:1px solid #ooff00;
}
input[type="number"]{
width: 100px;
}
</style>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>

<div align="center">
<h1>Products</h1>
<form method="post" action="#">
<table border="1">
<tr>
<td>ProductName</td>
<td>ProductPrice</td>
<td>Enter required quantity</td>
<td>Add items to cart</td>
</tr>

<%
int id=Integer.parseInt(session.getAttribute("UserID").toString());


%> 
<% String productname="";
double productsellingprice=0.0;
DAO dao=new DBImplementation();
ResultSet resultSet;
int pId=0;
String query="SELECT ProductID,ProductName,ProductSellingprice from product_tbl";
resultSet= dao.getData(query);
while(resultSet.next()){
	 pId=resultSet.getInt("ProductID");
	 productname=resultSet.getString("ProductName");
	 productsellingprice=Double.parseDouble(resultSet.getString("ProductSellingprice"));
     %>	
	<tr>
	<td><%=productname%></td>
	<td><%=productsellingprice%></td>
	<td><input type="number" name="quantity" value="quantity" onFocus="field_focus(this, 'quantity');" onblur="field_blur(this, 'quantity');" class="email" /></td> 
	<td>
	<a href="products.jsp?ProductID=<%=pId%>"><input type="submit" name="submit" id="name" ></a>
	</td>
	</tr>
	<% 
}
%>
</table><br>
</form>
<br>
<br>
<div align="center"><input type="submit" name="MakePayment" value="MAKEPAYMENT" /></div>
</div>
<%
double requiredquantity=0.0,availablequantity=0.0;	
if ((request.getParameter("submit") != null)) {
requiredquantity = Double.parseDouble(request.getParameter("quantity"));
if((request.getParameter("ProductID") != null))
{
int pid=Integer.parseInt(request.getParameter("ProductID"));
}
String query1="SELECT ProductQuantity from product_tbl where ProductName='"+productname+"'";
 resultSet=dao.getData(query1);
while(resultSet.next()){
    availablequantity=resultSet.getDouble("ProductQuantity");
}
	if(requiredquantity>availablequantity)
	{
		System.out.println("Sorry there is not sufficient quantity");
	}
	else
	{
		double pquantity=availablequantity-requiredquantity;
		String query2="insert into cartitems(ProductID,quantity,UserID) value ("+pid+","+requiredquantity+","+id+")";
	    int row=dao.putData(query2);
	    if(row>0)
	    {
	    	 %>
		        <script type="text/javascript">
			    alert("Items Successfully added to cart");
		         </script>
		         <%
	    System.out.println("");
	    String q="update product_tbl set ProductQuantity="+pquantity+" where ProductID="+pId+"";
	    int rows=dao.putData(q);
	    if(rows>0)
	    {
	    	System.out.println("Quantity Updated");
	    }
	     }
	    else
	    { 
	    	 %>
		        <script type="text/javascript">
			    alert("Failed to Add to Cart");
			    response.sendRedirect("products.jsp");
		         </script>
		         <%
	    }
	  }
	  }
       else
         {
	         %>
	        <script type="text/javascript">
		    alert("Failed to Add to Cart");
		    response.sendRedirect("products.jsp");
	         </script>
	         <%
	         
          }
 
%>
  <script type="text/javascript">
  function field_focus(field, email)
  {
    if(field.value == email)
    {
      field.value = '';
    }
  }
  function field_blur(field, password)
  {
    if(field.value == '')
    {
      field.value = password;
    }
  }
//Fade in dashboard box
$(document).ready(function(){
    $('.box').hide().fadeIn(1000);
    });

//Stop click event
$('a').click(function(event){
    event.preventDefault(); 
	});
  </script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>






