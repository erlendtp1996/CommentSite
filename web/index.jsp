<%-- 
    Document   : index
    Created on : Oct 31, 2017, 10:21:12 AM
    Author     : Thomas Erlendson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, java.util.Iterator, model.database.DatabaseActions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <title>erlendtp</title>
        <style>                       
            body {
                background: url("images/background/organic-tiles.png") repeat 0 0;
            }
            
            img {
		image-orientation: 0deg;
            }
            
            .comment-box {
                background-color: #c2c8d1;
                padding: 15px;
                margin: 20px;
                max-width: 65%;
                border-radius: 5px;
            }
            
            .container-fluid {
                padding: 5px;
                padding-top: 50px;
                padding-bottom: 50px;
                margin-top: 50px;
                padding-left: 25px;

            }
            
            .psd1, .psd2, .psd3 {
                background-color: white;
                border-radius: 5px;
            }
        
            .wordwrap {
                white-space: pre-wrap;
                white-space: -moz-pre-wrap;
                white-space: -pre-wrap;
                white-space: -o-pre-wrap;
                word-wrap: break-word;
            }
                        
            .page-content {
                width: 75%;
                max-width: 75%;
            }
                        
            #contact_list > li {
		padding-left: 5%;
		padding-right: 5%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div id="header" class="page-header psd0 text-center">
                <h2 style="font-size: 500%">Welcome!</h2>
            </div> <!-- End header -->
            <div id="content" class="container-fluid psd1">   
                <h3>About this page:</h3>
                <p class="page-content">This is a web page designed for users to submit comments. Implementing the model-view-controller pattern, this site submits a form to a Java servlet, which in turn accesses the model, and inserts the comment into a database. After comments have been submitted, the index.jsp will pull the comments from the database and display them on the page!</p>
                <p class="page-content">The database, hosted on <a href="https://www.freemysqlhosting.net/">Free MySQL Hosting</a>, contains a comment table, with two fields. The first field is the 'commentID', which auto increments, and the second field is the comment itself.</p>
                <p class="page-content">This web page makes use of the Bootstrap framework, and proved to be one of the more challenging aspects of the implementation.</p>
                <p class="page-content">Please feel free to visit my LinkedIn and Github page using the links at the bottom of the page. Don't forget to leave a comment!</p>
            </div> <!-- End of content -->            
            <hr/>            
            <div id="comment-section" class="container-fluid psd2">
                <h4>Comments</h4>
                <div id="comment-container">           
                    <%
                        ArrayList<String> results = model.database.DatabaseActions.actionGetComments();
                        Iterator<String> iterator = results.iterator();

                        while (iterator.hasNext()) {
                            String comment = iterator.next();
                            out.println("<div class=\"comment-box wordwrap\"><p>");
                            out.println(comment + "</p></div>");
                        }
                    %>
                </div> <!-- End of comment container -->
                <form action="addComment" method="post">
                    <div id="form-container" class="form-group">
                        <textarea type="comment" class="form-control" name="comment" cols="25" rows="4" placeholder="Submit a comment..." style="max-width: 50%;"/></textarea>
                        <button name="submit" class="btn btn-default" value="Submit" type="submit" style="margin:2px;">Submit</button>
                        <%
                            if (session.getAttribute("comment") != null) 
                            {
                                String comment = (String) session.getAttribute("comment");
                                out.println("<html><font color=\"black\">" + comment + "</font></html>");
                                session.setAttribute("comment", null);
                            }
                        %>
                    </div> <!-- End of form div -->
                </form> <!-- End of form -->
            </div> <!-- End of comment section -->         
            <hr/>            
            <div id="footer" class="container-fluid psd3 text-center">
                <ul id="contact_list" class="list-inline">
                    <li class="list-inline-item"><a href="mailto:erlendtp@dukes.jmu.edu" ><img src="images/logos/emailLogo.png" class="logo" alt="Email Logo" width="95" height="100"/></a></li>
                    <li class="list-inline-item"><a target="_blank" href="https://github.com/search?utf8=%E2%9C%93&q=user%3Aerlendtp1996&type=" ><img src="images/logos/githubLogo.jpg" class="logo" alt="github Logo" width="95" height="100"/></a></li>
                    <li class="list-inline-item"><a target="_blank" href="https://www.linkedin.com/in/thomas-erlendson-77b732137" ><img src="images/logos/linkedinLogo.png" class="logo" alt="linkedin Logo" width="95" height="100"/></a></li>
                    <li class="list-inline-item"><a target="_blank" href="https://www.facebook.com/search/top/?q=thomas%20erlendson" ><img src="images/logos/facebookLogo.png" class="logo" alt="Facebook Logo" width="95" height="100"/></a></li>
                </ul>
            </div> <!-- End of footer -->
        </div> <!-- End of container -->
    </body>
</html>
