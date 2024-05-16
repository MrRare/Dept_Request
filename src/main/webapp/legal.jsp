<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Finance</title>
  <%@ include file="CDN.jsp"  %>
  <script src="Script.js"></script>
  <link rel="stylesheet" href="Style.css">
  <%@ page import="java.sql.*,com.database.DbClass" %>

</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-lg-3 col-md-2"></div>
      <div class="col-lg-12 login-title" id="login">
        Legal
      </div>

    
      <div class="table-wrapper">
        <form>
        <table class="table table-hover t">
          <tr>
            <th>SNO</th>
            <th>TITLE</th>
            <th>DESCRIPTION</th>
            <th>REQUEST BY</th>
            <th>REQUEST TIME</th>
            <th>DEPARTMENT</th>
            <th>APPROVAL DATE</th>
            <th>APPROVAL BY</th>
            <th>STATUS</th>
          </tr>
          <% try
             {
               Connection con = DbClass.takeConnection();
               String query = "select * from management";
               PreparedStatement ps = con.prepareStatement(query);
               ResultSet rs = ps.executeQuery();
               
               while(rs.next())
               {
            	   if(rs.getString(6).equals("Legal") || rs.getString(6).equals("legal")){
                 out.println("<tr>");
                 out.println("<td>" + rs.getInt("Sno") + "</td>");
                 out.println("<td>" + rs.getString("Title") + "</td>");
                 out.println("<td>" + rs.getString("Description") + "</td>");
                 out.println("<td>" + rs.getString("RequestBy") + "</td>");
                 out.println("<td>" + rs.getTimestamp("RequestTime") + "</td>");
                 out.println("<td>" + rs.getString("Department") + "</td>");
                 out.println("<td>" + rs.getDate("ApprovalDate") + "</td>");
                 out.println("<td>" + rs.getString("ApprovalBy") + "</td>");
                 
                 if(rs.getString("Status").equals("Not Approved")){
                	 out.println("<td>");
                	 out.println("<input type='checkbox' class='circular-checkbox' name='id' value='"+rs.getInt("Sno")+"'>");
                	 out.println("</td>");
                	 }
                 else{
                	 out.println("<td>"+ rs.getString("Status")+"</td>"); 
                 }
                 out.println("</tr>");
            	   }
               }
          	    con.close();
               
             }
             catch(Exception e)
             {
               out.println(e);
             }
          %>
        </table>
        <input class='sign' type='submit' formaction='approveRequest.jsp' value='Approve'>
        <input class='sign sign2' type='submit' formaction='declineRequest.jsp' value='Decline'>
          </form>
            
      </div>
     

      <div class="col-lg-3 col-md-2"></div>
    </div>
  </div>

</body>
</html>
