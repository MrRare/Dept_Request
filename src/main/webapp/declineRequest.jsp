<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*,com.database.DbClass" %>
    <%
    try {
    	
    	String[] ids = request.getParameterValues("id");
    	 String username=(String)session.getAttribute("username");
     	String ans = "Declined";
     	int ru=0;
     	
    	for(String id : ids){
    		 ru=DbClass.approve(ans,username,Integer.parseInt(id));
    	}
    	
    	//int id=1;
    	//String username = request.getParameter("username");
    	//String dept = request.getParameter("dept");
    	
		
        if (ru > 0) {
        	String referer = request.getHeader("referer");
        	 response.sendRedirect(referer);
        } else {
          out.println("Failed to approve request.");
        }
 
      } catch (Exception e) {
        out.println(e);
      }
    
    %>