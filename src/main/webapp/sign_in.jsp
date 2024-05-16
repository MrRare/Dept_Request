<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sign_in</title>
</head>
<body>
<%@ page import="javax.servlet.http.HttpSession,com.database.DbClass" %>

  <%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    
   
   String status =  DbClass.checkUserData(name,pass);
   
   System.out.println(status);
   
   if(status==null)
	   out.println("Wrong");
   else{
	   session.setAttribute("username", name);
    if(status.equals("Legal")){
   response.sendRedirect("legal.jsp");
   }
   else if(status.equals("Finance")){
	response.sendRedirect("finance.jsp");
   }
   else {
	   response.sendRedirect("management.jsp");   
   }
   }
    
    %>
</body>
</html>