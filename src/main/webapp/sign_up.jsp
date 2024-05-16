<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sign_in</title>
</head>
<body>
<%@ page import="com.database.DbClass" %>

    <%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String department = request.getParameter("department");

   
   int status =  DbClass.insertUserData(name,pass,department);
   
   System.out.println(status);
   
   if(status==0){
	   out.println("something went wrong");
   }
   else{
	   response.sendRedirect("index.jsp"); 
   }
   
    
    %>
</body>
</html>