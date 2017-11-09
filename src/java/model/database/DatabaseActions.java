/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.database;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Thomas Erlendson
 * @verison 1.0
 * @date November 8th, 2017
 */
public class DatabaseActions {
    
    /*
     * Adds a comment to the database 
     */
    public static boolean addComment(String comment) {
        return actionAddComment(comment);
    }
    
    /*
     * Returns a list of comments
     */
    public static ArrayList<String> getComments() {
        return actionGetComments();
    }
    
    /**
     * Forms a SQL statement and adds it to the database
     * @param comment a comment
     * @return true if successful, false otherwise
     */
    public static boolean actionAddComment(String comment) {
        DatabaseHandler handle = new DatabaseHandler();
        String command = "INSERT INTO comments (comment) VALUES(";
        command += "'" + comment + "')";
        try {
            int resultCount = handle.doCommand(command);
            handle.close();
            return (resultCount > 0);
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Selects all the comments in the database and returns them.
     * @return list of Comments
     */
    public static ArrayList<String> actionGetComments() {
        ArrayList<String> results = new ArrayList<String>();
        DatabaseHandler handle = new DatabaseHandler();
        StringBuilder query = new StringBuilder();
        query.append("SELECT * from comments");
        try {
            ResultSet set = handle.doQuery(query.toString());
            while(set.next()) {
                System.out.println(set.getString(2));
                results.add(set.getString(2));
            }
            handle.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }
}
