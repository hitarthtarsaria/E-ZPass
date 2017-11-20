
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
									  <div class="dropdown" class="active">
									      <button class="dropbtn">Profile 
									        <i class="fa fa-caret-down"></i>
									      </button>
									      <div class="dropdown-content">
									        <a href="/CSCI6810/Changepassword.jsp?UserName=<%= session.getAttribute("Username")%>">Change Password</a>
									        <a href="logout.jsp">Logout</a>
									        
									      </div>
									  </div> 
				</div>

		<div style="padding-left:16px">
		
		<form name="changepass" action="/CSCI6810/Passconfiration.jsp" method="post">
			<table cellPadding="3" ALIGN='center'>
				<Tr bgcolor='#ECFAEB'>
					<td>UserName:</td>
					<td><input type="text" name="UserName" value='<%=request.getParameter("UserName")%>'/>
					</td>
				</Tr>
				<Tr bgcolor='#ECFAEB'>
									<td>Current Password:</td>
									<td><input type="PASSWORD" name="currentpass" SIZE=20/>
									</td>
				</Tr>
	
	
						<tr bgcolor='#ECFAEB'><td>Password:</td><td><INPUT TYPE="PASSWORD" NAME="PasswordField" SIZE=20></td></tr>
						<tr bgcolor='#ECFAEB'><td>Re-enter Password:</td><td><INPUT TYPE="PASSWORD" NAME="RePasswordField" SIZE=20></td></tr>

									
				<tr>
				<td><INPUT type='button' name='Changepassword' value='submit' onClick="checkInputs()" ></td>
				</tr>
	
			</table>
			
		</form>
		
		</div>
		
		</body>
	</html>
	<SCRIPT LANGUAGE="JavaScript">
	
	   function checkInputs()
	   {
	       var Prompts = "";
	             Username = window.document.changepass.UserName.value;
	             Password = document.changepass.PasswordField.value;
	             RePassword = changepass.RePasswordField.value;
	            
	             if (Username == "" || Password == "" || RePassword == "") {
	                if (Username == "")
	                   Prompts +="Please enter your username!\n";
	                if (Password == "")
	                   Prompts +="Please enter your password!\n";
	                if (RePassword == "")
	                   Prompts +="Please re-enter your password!\n";
	                
	                if (Prompts != "")
	                   window.alert(Prompts);
	             } else if (RePassword != Password) {
	                   window.alert("Your entered passwords are not same. Please enter the same one!");
	             }else {
	                document.changepass.submit();
	             }

	   }
	
	</SCRIPT>

	
