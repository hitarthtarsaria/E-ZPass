
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>

<%

  
	String Username = new String("");
	String Password = new String("");
	String Re_enterPassword = new String("");
	String CustomerName = new String("");
	String Address = new String("");
	String State = new String("");
	String City = new String("");
	String Eztag = new String("");
	String Balance = new String("");
	
	Username = request.getParameter( "UsernameField" );
	Password = request.getParameter( "PasswordField" );
        Re_enterPassword = request.getParameter( "RePasswordField" );
        CustomerName = request.getParameter( "NameField" );
        
        Address = request.getParameter( "AddressField" );
        State = request.getParameter( "StateField" );
        City = request.getParameter( "CityField" );
         Eztag = request.getParameter( "EzCode" );
          Balance = request.getParameter( "BalanceField" );
              
              Account Acct = new Account(Username, Password, Re_enterPassword, CustomerName, Address, State, City, Eztag, Balance);

%>
<%
	if (!Acct.signUp())
            out.println("Account creation failed because of existing username or invalid username. Please try again!");
        else { 
%>

		<HTML><HEAD></HEAD>
		<BODY BGCOLOR="Beige">
		<h4 ALIGN='center'>Congratulations! You have an account with us. Thank you! You can login now.</h4>
		<FORM NAME="LoginPage" ACTION="/CSCI6810/DashBoard.jsp" METHOD ="post">
		<TABLE cellspacing='10' cellpadding='3'  ALIGN='center'>
		<TR bgcolor='#ECFAEB'>
		<TD>USERNAME:</TD>
		<TD>
		<INPUT TYPE='text' NAME='UsernameField1' Value='<%= Username %>' SIZE='15' focused>
		</TD>
		</TR>
		<TR bgcolor='#ECFAEB'>
		<TD>PASSWORD:</TD>
		<TD>
		<INPUT TYPE='password' NAME='PasswordField1' Value='' SIZE='15'>
		<INPUT TYPE='button' NAME='submitBTN' VALUE='Login' onClick="checkInputs()">
		</TD>
		</TR>
		</TABLE>
		</FORM>
		</BODY>
		<SCRIPT LANGUAGE="JavaScript"> 
		function checkInputs()
		{
		 var Prompts = "";
		       Username = window.document.LoginPage.UsernameField1.value;
		       Password = window.document.LoginPage.PasswordField1.value;;
		
		
		       if (Username == "" || Password == "") {
		          if (Username == "")
		             Prompts +="Please enter your username!\n";
		          if (Password == "")
		             Prompts +="Please enter your password!\n";
		
		          if (Prompts != "")
		             window.alert(Prompts);
		       }
		       else {
		
		          document.LoginPage.submit();
       }
		
		}
		</SCRIPT>
		</HTML>

<%		}
%>
 
