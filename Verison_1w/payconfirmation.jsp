

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>

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
				    <div class="dropdown-content">
				      <a href="#">Add Vehicle</a>
				      <a href="#">List Vehicle</a>
				    </div>
				  </div> 
				  <div class="dropdown">
				      <button class="dropbtn">Toll 
				        <i class="fa fa-caret-down"></i>
				      </button>
				      <div class="dropdown-content" class="active">
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
				        <a href="#">Logout</a>
				      </div>
				  </div> 
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
 
