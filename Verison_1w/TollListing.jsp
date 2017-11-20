


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
				.topnav a.active {
								    background-color: #4CAF50;
						    color: white;
		 }<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
<h2>Listing of Vehicle</h2>





<%
String startdate, EndDate;
	
	
	
	 startdate = request.getParameter( "startdate" );
	 EndDate = request.getParameter( "EndDate" );
 
 
 



try {

String connectionURL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=JavaClass;integratedSecurity=true;";


Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
connection = DriverManager.getConnection(connectionURL);
statement = connection.createStatement();
String QueryString = "select TP.TransactionId,TP.Username,TP.Ezcode,TP.Tollplaza,TP.Amount,TP.Datetime from TransactionPaid as TP where replace(convert(varchar, TP.Datetime, 111), '/', '-') between  replace(convert(varchar, '"+startdate+"', 111), '/', '-') and replace(convert(varchar, '"+EndDate+"', 111), '/', '-') and TP.Username='"+session.getAttribute("Username")+"' order by TP.TransactionId desc";


rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc; align="center" ">
<TR>
<th>TransactionId </th>

<th> Ezcode </th>
<th> Tollplaza </th>
<th> Amount </th>
<th> Datetime </th>

</TR>
<TR>
<%
while (rs.next()) {
%>


<TD><%=rs.getInt(1)%></TD>

<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>

</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
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
</body>
</html>