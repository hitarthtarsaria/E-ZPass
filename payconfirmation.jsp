

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*;" %>

<%
	String Username, Eztagcode, Tagtype, Tollplaza , Tollamount;
	String resu;
	
	
	 Username = request.getParameter( "UserName" );
	 Eztagcode = request.getParameter( "EzTagCode" );
	 Tagtype = request.getParameter( "ddlViewBy" );
	
	
	  Tollplaza = request.getParameter( "TollplazaField" );
	  Tollamount = request.getParameter( "TollAmount" );
	  	            
       
       
       
             Account Acct = new Account(Tagtype, Eztagcode, Username, Tollplaza, Tollamount);

     
        if (Acct.signUp1())
							{
				Account Acct1 = new Account(Username);
		  		resu = Acct1.Balance();
	
	      Transaction Tran = new Transaction(Eztagcode, Username, Tollplaza, Tollamount);
	        if (Tran.InsertTrans())
	        {
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
		  	  <a href="/CSCI6810/Home.jsp">Home</a>
		  	  <a href="#news">Vehicle</a>
		  	  <a href="/CSCI6810/PayToll.jsp?UserName=<%=Username%>">Pay</a>
		  	  <a href="#about" class="active" >Confirmation</a>
		  	</div>
		  	
		  	<div style="padding-left:16px">
		  	
		  	
		  	
		  	<form name="payform" action="/CSCI6810/payconfirmation.jsp">
  			<table cellPadding="3" ALIGN='center'>
  			<Tr bgcolor='#ECFAEB'>
												<td>UserName:</td>
												 <td><%= Username%>
												</td>
											</Tr>
				
							<Tr bgcolor='#ECFAEB'>
								<td>EztagCode:</td>
								<td><%=Eztagcode%>
								</td>
							</Tr>
				
								<Tr bgcolor='#ECFAEB'>
									<td>Toll Amount:</td>
									<td><%= Tollamount%>
									</td>
								</Tr>
				
								<Tr bgcolor='#ECFAEB'>
								 	<td>Balance:</td>
								       <td><%= resu%>
								 	</td>
								</Tr>
								
								
								
								
													
						</table>
						
					</form>
		
		  	
		  	</div>
		  	
		  <%	
	
		 							  }
						}
	      else {
	           out.println("Account creation failed because of existing username or invalid username. Please try again!");

	

		}
%>
 
