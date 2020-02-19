<%-- 
    Document   : Images
    Created on : Feb 19, 2020, 3:18:39 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Upload</title>

        <style>
            body {font-family: monospace;font-size: 20px}

            /* Full-width input fields */
            input[type=text], input[type=file] {
                width: 70%;
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

            .container {
                padding: 16px;
            }


            /* The Modal (background) */
            .modal {
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                /*background-color: rgb(0,0,0);  Fallback color */
                background-color: rgba(0,0,0,0.4);  
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                margin: 0.2% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
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

           
            @media screen and (max-width: 500px) {
                input[type=text],input[type=file]{
                    width:100%;
                }
            
            }
        </style>
    </head>
    <body>

        <form action="Upload" method="post" enctype="multipart/form-data" style="background:whitesmoke;box-shadow: 2px 2px 2px black">

            <h3 style="text-align:center">How To Store Image In Database Using Servlet && JSP</h3>
            <div style="display:flex;flex-direction: column;padding:2%;">
                <Label style="margin-bottom:10px">Your Name</Label>
                <input type="text" style="border:1px solid blue;" id="first" required name="username"/>
                <i>** Username must be unique</i>
            </div>
            <div style="display:flex;flex-direction: column;padding:2%;">
                <Label>Select Image to Upload</Label>
                <br>
                <input type="file" style="border:1px solid blue;" name="myimg"/>
            </div>

            <div style="padding:2%;">
                <button style="width:auto;" type="submit">Upload</button>
            </div>
        </form>
        <%

            String name = (String)session.getAttribute("uname");
            String pth = (String)session.getAttribute("pathdir");
           if(name != null && pth != null){
               out.print("<form action='View.jsp'>"
                       +"<input type='hidden' name='user' value='"+name+"' required>"
                       +"<input type='hidden' name='filepath' value='"+pth+"' required>"
                       + "<button type='submit'>View Uploaded Image</button>"
                       +" </form>");
           }
        %>


    </body>
</html>
