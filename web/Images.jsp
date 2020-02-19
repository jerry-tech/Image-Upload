<%-- 
    Document   : Images
    Created on : Feb 19, 2020, 3:18:39 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            body {font-family: monospace;font-size: 20px}

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                background-color: blue;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>

        <form action="Upload" method="post" enctype="multipart/form-data" style="background:whitesmoke;box-shadow: 2px 2px 2px black">
            <h3 style="text-align:center">How To Store Image In Database Using Servlet && JSP</h3>
            <div style="display:flex;flex-direction: column;padding:2%;">
                <Label>Select Image to Upload</Label>
                <br>
                <input type="file" style="border:1px solid blue; width:30%;" name="myimg"/>
            </div>

            <div style="padding:2%;">
                <button style="width:auto;" type="submit">Upload</button>
            </div>
        </form>

        <!--<button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;">View Uploaded Image</button>-->

        <div id="id01" class="modal">

            <div class="modal-content animate" >

                <%
//                    String filePathImg = null;
//                    
//                    if(filePathImg != null){
//                        
//                        Connection con = null;
//
//                        Statement stmt = null;
//                        ResultSet rs = null;
//                        try {
//                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//                            con = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=ImageUpload2;user=;password=");
//
//                            stmt = con.createStatement();
//                            rs = stmt.executeQuery("select upload from Images");
//                            while (rs.next()) {
//
//                                filePathImg = rs.getString("upload").substring(54);
//                                    out.print(filePathImg);
//                            }
//
//                        } catch (Exception e) {
//                            out.print("Unable to display image");
//                            out.print("Image display error=" + e);
//                            return;
//                        }
//                        out.print("<a><img src='" + filePathImg + "' alt='No Profile Picture'/></a> ");
//                    }
//                    
                    


                %>
            </div>
        </div>

        <script>
            // Get the modal
//            var modal = document.getElementById('id01');
//
//            // When the user clicks anywhere outside of the modal, close it
//            window.onclick = function (event) {
//                if (event.target == modal) {
//                    modal.style.display = "none";
//                }
//            }
        </script>

    </body>
</html>
