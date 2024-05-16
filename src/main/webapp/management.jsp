<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Management</title>
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
        Management
      </div>

    
      <div class="table-wrapper">
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
               //String username=(String)session.getAttribute("username");
               String query = "select * from management";
               PreparedStatement ps = con.prepareStatement(query);
               ResultSet rs = ps.executeQuery();
               while(rs.next())
               {
                 out.println("<tr>");
                 out.println("<td>" + rs.getInt("Sno") + "</td>");
                 out.println("<td>" + rs.getString("Title") + "</td>");
                 out.println("<td>" + rs.getString("Description") + "</td>");
                 out.println("<td>" + rs.getString("RequestBy") + "</td>");
                 out.println("<td>" + rs.getTimestamp("RequestTime") + "</td>");
                 out.println("<td>" + rs.getString("Department") + "</td>");
                 out.println("<td>" + rs.getDate("ApprovalDate") + "</td>");
                 out.println("<td>" + rs.getString("ApprovalBy") + "</td>");
                 out.println("<td>" + rs.getString("Status") + "</td>");
                 out.println("</tr>");
               }
               con.close();
             }
             catch(Exception e)
             {
               out.println(e);
             }
          
          %>
        </table>
       <a class="sign" href="#low">Create Request</a>
      </div>
       
      <div class="col-lg-3 col-md-2"></div>
    </div>
     <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-title" id="login">
                    Create Request
                </div>
                <div class="col-lg-12 login-form">
                    <form action="createReq.jsp" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="Sno" placeholder="SNO">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="Title">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="desp" placeholder="Description">
                        </div>
                        <div class="form-group">
<input type="hidden" class="form-control" name="reqBy" value="${username }">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="department" placeholder="Department">
                        </div>
                        <div class="form-group login-btm">
                            <button type="submit" id="low" class="btn btn-outline-primary login">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-md-2"></div>
        </div>
  </div>

</body>
</html>
