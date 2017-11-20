

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>
 

<%
	
	String Username,EzTagcode,VehicleType,PlateNo,ModelName,color,Make,Year;
	
	
	
	 Username = request.getParameter( "Username" );
	 EzTagcode = request.getParameter( "EzTagcode" );
	VehicleType = request.getParameter( "ddlViewBy" );
	PlateNo = request.getParameter("PlateNo");
	ModelName= request.getParameter("ModelName");
	color = request.getParameter("color");
	Make= request.getParameter("Make");
	Year = request.getParameter("Year");
		  	            
       
       
       
             
		AddVehicle Veh = new AddVehicle(Username,EzTagcode,VehicleType,PlateNo,ModelName,color,Make,Year);
		Veh.adveh();
		response.sendRedirect("Vehicle.jsp");
 %>