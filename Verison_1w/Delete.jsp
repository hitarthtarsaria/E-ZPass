<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>



<%
try {


Connection conn = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
String connectionURL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=JavaClass;integratedSecurity=true;";
conn = DriverManager.getConnection(connectionURL);

String recordToDelete = request.getParameter("deleteid");

String sql = "DELETE FROM Vehicle where VehicleID = ?";
    PreparedStatement prest = conn.prepareStatement(sql);
    prest.setString(1, recordToDelete);
    int del = prest.executeUpdate();
   response.sendRedirect("recordsofvehicle.jsp"); // redirect to JSP one, which will again reload.

    conn.close();





}catch(SQLException e){ 
    System.out.println(e.getMessage()); 
    }
    %>
