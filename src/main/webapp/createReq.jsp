<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>createReq</title>
</head>
<body>


<%@ page import="com.database.DbClass" %>

    <%
  
    int Sno = Integer.parseInt(request.getParameter("Sno"));
    String name = request.getParameter("name");
    String desp = request.getParameter("desp");
    String reqBy = request.getParameter("reqBy");
    String department = request.getParameter("department");

   int status =  DbClass.insertReqData(Sno,name,desp,reqBy,department);
   
   System.out.println(status);
   
   if(status==0){
	  out.println("same id's");
   }
   else{
	   response.sendRedirect("management.jsp");
   }
   
    
    %>
</body>
</html>