

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>
 

<%
	
	String Username,EzTagcode,VehicleType,PlateNo,ModelName,color;
	
	
	
	 Username = request.getParameter( "Username" );
	 EzTagcode = request.getParameter( "EzTagcode" );
	VehicleType = request.getParameter( "ddlViewBy" );
	PlateNo = request.getParameter("PlateNo");
	ModelName= request.getParameter("ModelName");
	color = request.getParameter("color");
		  	            
       
       
       
             
		AddVehicle Veh = new AddVehicle(Username,EzTagcode,VehicleType,PlateNo,ModelName,color);
		Veh.adveh();


 %>