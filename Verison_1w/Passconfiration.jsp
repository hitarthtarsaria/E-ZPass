

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="Com.Tarsaria.*" %>

<%
	String Username = new String("");
	String Password = new String("");
	String Re_enterPassword = new String("");
	
	
	Username = request.getParameter( "UserName" );
	Password = request.getParameter( "currentpass" );
        Re_enterPassword = request.getParameter("RePasswordField");
       
 
              
        Account Acct = new Account(Username, Password);

%>
<%
	if (!Acct.changePassword(Re_enterPassword))
            out.println("Not updated");
        else { 

out.println("Sucessful");
		
		}
%>
 
