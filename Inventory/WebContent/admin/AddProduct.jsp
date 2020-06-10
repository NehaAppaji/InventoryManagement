
<%@page import="beans.DAO"%>
<%@page import="beans.DBImplementation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
</style>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<body> 
<%int catID=0;
%>
<form method="post" action="#">
<div class="box">
<h1>Add Product</h1>
<select class="form-control" name="categoryId" id="categoryId">
<%
DBImplementation dao = new DBImplementation();
ResultSet resultSet;
String query = "select * from category";
resultSet = dao.getData(query);
while (resultSet.next()) {
String categoryname = resultSet.getString("CategoryName");
catID = resultSet.getInt("CategoryID");
%>
<option value="<%=catID%>"><%=categoryname%></option>
<%
}
%>
</select>
<input type="text" name="Productname" value="Productname" onFocus="field_focus(this, 'Productname');" onblur="field_blur(this, 'Productname');" class="email" />
 <input type="text" name="Productcostprice" value="Productcostprice" onFocus="field_focus(this, 'Productcostprice');" onblur="field_blur(this, 'Productcostprice');" class="email" />
<input type="text" name="Productsellingprice" value="Productsellingprice" onFocus="field_focus(this, 'Productsellingprice');" onblur="field_blur(this, 'Productsellingprice');" class="email" />
<input type="text" name="Productquantity" value="Productquantity" onFocus="field_focus(this, 'Productquantity');" onblur="field_blur(this, 'Productquantity');" class="email" />

<br>

<div class="btn"><input type="submit" name="AddProduct" value="ADDPRODUCT"/></div>
</div> <!-- End Box -->
</form>

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
<%
int rows;
DAO dao1 = new DBImplementation();	
if (request.getParameter("AddProduct") != null) {
String productname = request.getParameter("Productname");
String productcostprice = request.getParameter("Productcostprice");
String productsellingprice = request.getParameter("Productsellingprice");
String productquantity = request.getParameter("Productquantity");
 catID=Integer.parseInt(request.getParameter("categoryId"));

String query1 = "insert into product_tbl (ProductName,ProductCostprice,ProductSellingprice,ProductQuantity,CategoryID) value('"+productname+"' , "+productcostprice+" , "+productsellingprice+" , '"+productquantity+"',"+catID+")";
rows = dao.putData(query1);
if (rows>0) 
{
	System.out.println("Product added successfully");
//response.sendRedirect("AddProduct.jsp");
}	
else
{
	%>
	<script type="text/javascript">
		alert("Failed to add product");
	</script>
	<%
	response.sendRedirect("AddProduct.jsp");
}
}
%>
</body>
</html>
