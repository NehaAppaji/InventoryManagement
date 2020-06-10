
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
</style>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<form method="post" action="#">
<div class="box">
<h1>Register</h1>
<input type="text" name="username" value="username" onFocus="field_focus(this, 'username');" onblur="field_blur(this, 'username');" class="email" />
<input type="email" name="email" value="email" onFocus="field_focus(this, 'email');" onblur="field_blur(this, 'email');" class="email" />
<br>
<br>
<input type="password" name="password" value="password" onFocus="field_focus(this, 'password');" onblur="field_blur(this, 'password');" class="password" />
<input type="number" name="mobileno" value="mobileno" onFocus="field_focus(this, 'mobileno');" onblur="field_blur(this, 'mobileno');" class="email" />
<input type="text" name="address" value="address" onFocus="field_focus(this, 'address');" onblur="field_blur(this, 'address');" class="email" />
<div class="btn"><input type="submit" name="Register" value="REGISTER"/></div>
</div> <!-- End Box -->
</form>
<p>Forgot your password? <u style="color:#f1c40f;">Click Here!</u></p>
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
DAO dao = new DBImplementation();				
if (request.getParameter("Register") != null) {
String username = request.getParameter("username");
String usermail = request.getParameter("email");
String password = request.getParameter("password");
String usermobileno = request.getParameter("mobileno");
String useraddress = request.getParameter("address");
String query = "insert into user_tbl (UserName,MailID,Password,MobileNumber,Address) value('"+username+"','"+usermail+"','"+password+"','"+usermobileno+"','"+useraddress+"')";
rows = dao.putData(query);
if (rows>0) 
{
response.sendRedirect("Login.jsp");
}	
else
{
	%>
	<script type="text/javascript">
		alert("Failed to Register");
	</script>
	<%
	response.sendRedirect("Registration.jsp");
}
}
%>

