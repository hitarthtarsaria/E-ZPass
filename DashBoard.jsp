<!--
/******************************************************************************
*	Program Author: Dr. Yongming Tang for CSCI 6810 Java and the Internet *
*	Date: September, 2012						      *
*******************************************************************************/
-->

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*;" %>

<%
	String Username,Password,CustomerName,EzTag;
	Username =request.getParameter("UsernameField1");
	Password =request.getParameter("PasswordField1");
	
              
       Account Acct = new Account(Username, Password);
       
       CustomerName = Acct.signIn();
       
             
       String Custname= CustomerName;
       
       Account Acct1 = new Account(Username);
              EzTag = Acct1.GetEztag();
              
      
        
       
	session.setAttribute("Custname",Custname);
	session.setAttribute("Username",Username);
      session.setAttribute("EzTag",EzTag);
       
		     
        

%>
<%
	if (session.getAttribute("Custname") == "") {
	
            out.println("Login failed because of invalid username or password. Please try again!");
            }
        else { 
%>

	<!DOCTYPE html>
	<html>
	<head>
	<style>
	body {margin:0;}
	
	.topnav {
	  overflow: hidden;
	  background-color: #333;
	}
	
	.topnav a {
	  float: left;
	  display: block;
	  color: #f2f2f2;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}
	
	.topnav a:hover {
	  background-color: #ddd;
	  color: black;
	}
	
	.topnav a.active {
	    background-color: #4CAF50;
	    color: white;
	}
	</style>
	</head>
	<body>
	
	<div class="topnav">
	  <a class="active" href="/CSCI6810/DashBoard.jsp?UserName=<%=Username%>">Home</a>
	  <a href="/CSCI6810/Vehicle.jsp?UserName=<%=Username%>">Vehicle</a>
	  <a href="/CSCI6810/PayToll.jsp?UserName=<%=Username%>">Pay</a>
	  <a href="#">Confirmation</a>
	  <a href="/CSCI6810/recordsofvehicle.jsp?UserName=<%=Username%>">Records</a>
	</div>
	
	<div style="padding-left:16px">
	
	<p> Welcome <%= CustomerName %> </p>
	
 
	
	
	</div>
	
	</body>
</html>

<%		}
%>
 
