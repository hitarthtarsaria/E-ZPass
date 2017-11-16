
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
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
		  <a  href="/CSCI6810/Home.jsp">Home</a>
		  <a href="/CSCI6810/Vehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Vehicle</a>
	  <a href="/CSCI6810/PayToll.jsp?UserName=<%= session.getAttribute("Username")%>">Pay</a>
		  <a href="#about">Confirmation</a>
		  <a href="/CSCI6810/recordsofvehicle.jsp" class="active">Records</a>
		</div>

<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
<form name=myname method=post action="delete.jsp">
<h2>Listing of Vehicle</h2>
<%
try {




Connection conn = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionURL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=JavaClass;integratedSecurity=true;";
conn = DriverManager.getConnection(connectionURL );
ResultSet rs = null;
Statement st=null;
st=conn.createStatement();
String QueryString = "select * from Vehicle where Username='"+session.getAttribute("Username")+"'";
rs = st.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc; align="center" ">
<TR>
<th>Vehicle ID </th>

<th> EzTagCode </th>
<th> Vehicle Type </th>
<th> Plate No </th>
<th> Model Name </th>
<th> Color </th>
</TR>
<TR>
<%
int i=0; while (rs.next()) {
%>

<td><input type="checkbox" name="check<%=i%>" 
<TD><%=rs.getInt(1)%></TD>

<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
</TR><%
i++;
%>
<% } %>
<%
// close all the connections.
rs.close();
st.close();
conn.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</TABLE>
<input type="submit">
</font>
</form>
</body>
</html>