/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.COPY_ATTRIBUTES;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@MultipartConfig//called the @multipartconfig so as to ensure file uploads
public class Upload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String endswith = "";
        String startwith = "";
        String fileName = "";
        
        String name = request.getParameter("username");
        Part myloc = request.getPart("myimg");//getting the image part of the image uploaded

        String filePath = myloc.toString();//converting the part gotten from the uploaded image to string
        fileName = myloc.getSubmittedFileName();//getting the submitted file name
        Long byteSize = myloc.getSize();//getting the size of the image 
        String formfield = myloc.getName();//getting the image name 
        
        if(!"".equals(fileName)){

                if (filePath.startsWith("File name=" + fileName + ", StoreLocation=")) {
                    startwith = "File name=" + fileName + ", StoreLocation=";
                }//checking if the part starts with the particular sequence just above

                if (filePath.endsWith(", size=" + byteSize + "bytes, isFormField=false, FieldName=" + formfield + "")) {

                    endswith = ", size=" + byteSize + "bytes, isFormField=false, FieldName=" + formfield + "";
                }  //checking if the part ends with the particular sequence just above   

                int start = startwith.length();//getting the length of the starting part of the of the Path
                int end = endswith.length();//getting the length of the ending part of the of the Path
                int total = filePath.length();//getting the length of the total file path

                int offset = total - end;//getting the offsetted part of the ending part of the Path

                String image = myloc.toString();

                String imges = image;

                String filePathcopy = imges.substring(start, offset).replaceAll("\\\\", "/");//used to get the part specifically the Path of the image only and format the windows path type(\) to the java accepted part(/ or \\).


                String targetPath = "C:/Users/HP/Documents/NetBeansProjects/Image Upload/web/Images/" + fileName + "";//getting the target file path which will be inserted into the database //change accordingly

                Path source = Paths.get(filePathcopy);//the source of the image
                Path target = Paths.get(targetPath);//the Path where the image will be moved to.//change accordingly

                try {
                    Files.copy(source, target, REPLACE_EXISTING, COPY_ATTRIBUTES);
                } catch (IOException e) {
                  out.print("<p style='text-align:center;color:red'>Error in Uploading your image to the target Folder</p>");
                }//used to copy the image to the target folder



                try {

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                try (Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=ImageUpload2;user=//add username;password=//add password");) {
                    //setting auto commit false for concurrency which is true by default
                    con.setAutoCommit(false);

                    try (PreparedStatement ps = con.prepareStatement("insert into Images values(?,?)");) {
                        
                        ps.setString(1, name);
                        ps.setString(2, targetPath);
                        
                        int img = ps.executeUpdate();
                        if (img > 0) {
                            
                            HttpSession session=request.getSession();  
                                 session.setAttribute("uname",name); 
                                 session.setAttribute("pathdir",fileName);
                                 
                            out.print("<p style='text-align:center;color:green'>Image Upload of "+fileName+" Successfull</p>");
                            request.getRequestDispatcher("Images.jsp").include(request, response);
                            con.commit();
                        } else {
                            out.print("<p style='text-align:center;color:red'>Error in Uploading your image</p>");
                            request.getRequestDispatcher("Images.jsp").include(request, response);
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.print("<p style='text-align:left;color:red'>Error in Uploading your image</p>");
                request.getRequestDispatcher("Images.jsp").include(request, response);
            }
        }else{
            out.print("<p style='text-align:left;color:red'>Error in Uploading your image Please select an image</p>");
                request.getRequestDispatcher("Images.jsp").include(request, response);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
