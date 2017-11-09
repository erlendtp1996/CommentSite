package model.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Thomas Erlendson
 * @version 1.0
 * @date November 8th, 2017
 */
public class DatabaseHandler {
    
    // Database access credentials
    protected String driverName = "com.mysql.jdbc.Driver", url = "jdbc:mysql://sql9.freemysqlhosting.net:3306/sql9203012", userId = "sql9203012", password = "BF5i399N4C";
    
    // Database connection 
    private Connection con;
    
    // SQL Statement
    protected Statement statement;
    
    // Connection open status
    protected boolean isOpen = false;
    
    public DatabaseHandler() {
    }
    
    /**
     * Open database connection
     * @throws SQLException if the database connection cannot be established
     */
    public void open() throws SQLException {
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, userId, password);
            statement =con.createStatement();
            isOpen = true;
            return;
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
            return;
        }
    }
    
    /**
     * Close database connection
     * @throws SQLException if the database connection cannot fail
     */
    public void close() throws SQLException {
        statement.close();
        con.close();
        isOpen = false;
    }
    
    /**
     * Execute a command and return a result count.
     * @param command SQL command 
     * @return Amount of rows affected
     * @throws SQLException any database error
     */
    public int doCommand(String command) throws SQLException {
        if (!isOpen) {
            open();
        }
        int resultCount = statement.executeUpdate(command);
        return resultCount;
    }
    
    /**
     * Execute a query and return a ResultSet.
     * @param query SQL query
     * @return ResultSet of the results
     * @throws SQLException if the database query fails
     */
    public ResultSet doQuery(String query) throws SQLException {
        if (!isOpen) {
            open();
        }
        ResultSet rs = statement.executeQuery(query);
        return rs;
    }    
}
