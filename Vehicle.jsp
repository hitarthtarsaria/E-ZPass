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
		  <a  href="/CSCI6810/Home.jsp" >Home</a>
		   <a href="/CSCI6810/Vehicle.jsp?UserName=<%= session.getAttribute("Username")%>" class="active">Vehicle</a>
	  <a href="/CSCI6810/PayToll.jsp?UserName=<%= session.getAttribute("Username")%>">Pay</a>
		  <a href="#about">Confirmation</a>
		  <a href="/CSCI6810/recordsofvehicle.jsp?UserName=<%= session.getAttribute("Username")%>">Records</a>
		</div>
		
		<div style="padding-left:16px">
				
				<form name="payform" action="/CSCI6810/Vehiclelist.jsp">
					<table cellPadding="3" ALIGN='center'>
						<Tr bgcolor='#ECFAEB'>
							<td>UserName:</td>
							<td><input type="text" name="Username" value='<%=request.getParameter("UserName")%>'/>
							</td>
						</Tr>
			
			<Tr bgcolor='#ECFAEB'>
								
						<td>EzTagCode:</td>
						<td><input type="text" name="EzTagcode" SIZE='15' value='<%=session.getAttribute("EzTag")%>' focused/></td>
			</Tr>
			
							
							
							<tr bgcolor='#ECFAEB'>
												<td>Vehicle Type:</td>
												<td>
													<select id='ddlViewBy' name='ddlViewBy'>
														<option value='select'>----SELECT-----</option>
														<option value='Hatchback'>Hatchback</option>
														<option value='Sedan'>Sedan</option>
														<option value='MPV'>MPV</option>
														<option value='SUV'>SUV</option>
													</select>
												</td>
											</tr>
							
							
												
							
											<tr bgcolor='#ECFAEB'>
												<td>Plate No:</td>
												<td><input type="text" name="PlateNo" SIZE='15' focused/></td>
											</tr>
											<tr bgcolor='#ECFAEB'>
											<td>Model Name</td>
											<td><input type="text" name="ModelName" SIZE='15' focused/></td>
											</tr>
							
											<tr bgcolor='#ECFAEB'>
												<td>Color</td>
												<td><input type="text" name="color" SIZE='15' focused/></td>
							
												
						</tr>
						<tr>
						<td><INPUT type='button' name='submitBTN' value='Add' onClick="checkInputs()" ></td>
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
		       var ddlViewBy1 = window.document.payform.ddlViewBy.value
		       
		
		      
		          if (ddlViewBy1 == "select")
		          {
		             Prompts +="Please Select Account type !\n";
		             }
		          
		
		          if (Prompts != "")
		             window.alert(Prompts);
		      
		       else {
		          document.payform.submit();
		       }
		   }
		
	</SCRIPT>