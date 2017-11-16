<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>

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
		  <a  href="/CSCI6810/Home.jsp">Home</a>
		  <a href="/CSCI6810/Vehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Vehicle</a>
	  <a href="/CSCI6810/PayToll.jsp?UserName=<%= session.getAttribute("Username")%>">Pay</a>
		  <a href="#about">Confirmation</a>
		  <a href="/CSCI6810/recordsofvehicle.jsp" class="active">Records</a>
		</div>




<%String id[]= new String[10];
for(int i=0;i<10;i++){
id[i]=request.getParameter("check"+i);
int b = Integer.parseInt(id[i]);
out.println(id[i]);
}
%>
<%
try {


Connection conn = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionURL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=JavaClass;integratedSecurity=true;";
conn = DriverManager.getConnection(connectionURL);
ResultSet rs = null;

Statement st = null;
st=conn.createStatement();
for(int a=0;a<10;a++){
out.println("hello");
String QueryString = "delete from Vehicle where VehicleID='"+id[a]+"'";
rs = st.executeQuery(QueryString);


}
rs.close();
st.close();
conn.close();
}catch(SQLException e){ 
    System.out.println(e.getMessage()); 
    }
    %>
