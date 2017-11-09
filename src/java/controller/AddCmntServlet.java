package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.database.DatabaseActions;

/**
 *
 * @author Thomas Erlendson
 * @verison 1.0
 * @date November 8th, 2017
 */
public class AddCmntServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String commentMessage;
        String comment = request.getParameter("comment");
        
        //if the comment has no length or is null
        if (comment.length() == 0 || comment == null){
            commentMessage = "ERROR: Invalid comment";
        }
        else {    
            //validate addition to the database
            if (DatabaseActions.addComment(comment)) {
                commentMessage = "Comment added";
            }
            else {
                commentMessage = "Failed to add comment";
            }
        }
        session.setAttribute("comment", commentMessage);  

        //forward back to add book
        forwardRequest(request, response, "/index.jsp");
    }

    /*
     * forward request to a new location 
     */
    private void forwardRequest(HttpServletRequest request, HttpServletResponse response, String url) throws IOException, ServletException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
}
