<%-- 
    Document   : View
    Created on : Feb 19, 2020, 5:19:42 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image</title>
    </head>
    <body>
        <jsp:include page="Images.jsp"/>
        <div id="id01" class="modal">
  <a href="Logout.jsp" title="close modal" style="text-decoration: none; padding-right:20px;float:right; color:red; font-size:60px;margin-top:-5%;font-weight: bold">&times;</a>
            
            <div class="modal-content animate" >
              
                <%
                    
                    String username = request.getParameter("user");
                    String uploadName = request.getParameter("filepath");
                    String filePathImg = null;
                    String srcPath="";
                    
                    if(username != null){
                        Connection con = null;

                        Statement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=ImageUpload2;user=//add username;password=//add password");

                            stmt = con.createStatement();
                            rs = stmt.executeQuery("select upload from Images where Name = '"+username+"' ");
                            while (rs.next()) {

                                filePathImg = rs.getString("upload");
                                if(filePathImg.contains(uploadName)){
                                   
                                    srcPath = "Images/"+uploadName+"";//Images is the folder which the uploaded image goes to so change accordingly;
                                    
                                }
                                   
                            }

                        } catch (Exception e) {
                            out.print("Unable to display image");
                            out.print("Image display error=" + e);
                            return;
                        }
                        out.print("<a><img style='width:100%; box-shadow:7px 7px 7px white' src='" + srcPath + "' alt='No Profile Picture'/></a> ");
                    }else{
                        out.print("<p style='text-align:left;color:red'>No Image Uploaded i.e No Image to Display</p>");
                         request.getRequestDispatcher("Images.jsp").include(request, response);
                    }
                        
                        


                %>
            </div>
        </div>
    </body>
</html>
