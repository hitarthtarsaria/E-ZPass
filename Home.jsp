

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*;" %>



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
	  <a class="active" href="/CSCI6810/Home.jsp">Home</a>
	  <a href="/CSCI6810/Vehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Vehicle</a>
	  <a href="/CSCI6810/PayToll.jsp?UserName=<%= session.getAttribute("Username")%>">Pay</a>
	  <a href="#">Confirmation</a>
	  <a href="/CSCI6810/recordsofvehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Records</a>
	</div>
	
	<div style="padding-left:16px">
	
	<p> Welcome <%= session.getAttribute("Custname")%></p>
	
 
	
	
	</div>
	
	</body>
</html>


