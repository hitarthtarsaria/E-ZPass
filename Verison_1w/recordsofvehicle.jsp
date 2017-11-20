
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
			.navbar {
				    overflow: hidden;
				    background-color: #333;
				    font-family: Arial;
				}
				
				.navbar a {
				    float: left;
				    font-size: 16px;
				    color: white;
				    text-align: center;
				    padding: 14px 16px;
				    text-decoration: none;
				}
				
				.dropdown {
				    float: left;
				    overflow: hidden;
				}
				
				.dropdown .dropbtn {
				    font-size: 16px;    
				    border: none;
				    outline: none;
				    color: white;
				    padding: 14px 16px;
				    background-color: inherit;
				}
				
				.navbar a:hover, .dropdown:hover .dropbtn {
				    background-color: red;
				}
				
				.dropdown-content {
				    display: none;
				    position: absolute;
				    background-color: #f9f9f9;
				    min-width: 160px;
				    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				    z-index: 1;
				}
				
				.dropdown-content a {
				    float: none;
				    color: black;
				    padding: 12px 16px;
				    text-decoration: none;
				    display: block;
				    text-align: left;
				}
				
				.dropdown-content a:hover {
				    background-color: #ddd;
				}
				
				.dropdown:hover .dropdown-content {
				    display: block;
			}
			.topnav a.active 
			{
			background-color: 	#FF0000;
			color: red;
		 }
			</style>
			
			</head>
			<body bgcolor="Beige">
					<div class="navbar">
											  <a href="/CSCI6810/Home.jsp">Home</a>
											  <div class="dropdown">
											    <button class="dropbtn">Vehicle 
											      <i class="fa fa-caret-down"></i>
											    </button>
											    <div class="dropdown-content active">
											      <a href="/CSCI6810/Vehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Add Vehicle</a>
											      <a href="/CSCI6810/recordsofvehicle.jsp?UserName=<%= session.getAttribute("Username")%>">List Vehicle</a>
											    </div>
											  </div> 
											  <div class="dropdown">
											      <button class="dropbtn">Toll 
											        <i class="fa fa-caret-down"></i>
											      </button>
											      <div class="dropdown-content">
											        <a href="/CSCI6810/PayToll.jsp?UserName=<%= session.getAttribute("Username")%>">Pay Toll</a>
											        <a href="/CSCI6810/search.jsp?UserName=<%= session.getAttribute("Username")%>">Confirmation</a>
											      </div>
											  </div> 
											  <div class="dropdown">
											      <button class="dropbtn">Profile 
											        <i class="fa fa-caret-down"></i>
											      </button>
											      <div class="dropdown-content">
											        <a href="/CSCI6810/Changepassword.jsp?UserName=<%= session.getAttribute("Username")%>">Change Password</a>
											        <a href="logout.jsp">Logout</a>
											        
											      </div>
											  </div> 
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
<th> Make </th>
<th> Model Name </th>
<th> Year </th>
<th> Color </th>
<th> Delete </th>
</TR>
<TR>
<%
int i=0; while (rs.next()) {

%>


<TD><%=rs.getInt("VehicleID")%></TD>
<TD><%=rs.getString("Ezcode")%></TD>
<TD><%=rs.getString("VehicleType")%></TD>
<TD><%=rs.getString("PlateNo")%></TD>
<TD><%=rs.getString("Make")%></TD>
<TD><%=rs.getString("ModelName")%></TD>
<TD><%=rs.getString("Year")%></TD>
<TD><%=rs.getString("color")%></TD>
<td>

                 <a href ="Delete.jsp?deleteid=<%=rs.getInt("VehicleID")%>">Delete</a>
              </td>
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

</font>
</form>
</body>
</html>