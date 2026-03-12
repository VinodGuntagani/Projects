package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBInit {

    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static void initialize() {

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = con.createStatement();

            // Create Database
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS helpdesk");

            // Connect to helpdesk DB
            Connection dbCon = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/helpdesk", USER, PASSWORD);
            Statement dbStmt = dbCon.createStatement();

            // Users Table
            dbStmt.executeUpdate("CREATE TABLE IF NOT EXISTS users ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "name VARCHAR(100),"
                    + "email VARCHAR(100),"
                    + "password VARCHAR(100),"
                    + "role VARCHAR(20))");

         // Insert default admin if not exists
            dbStmt.executeUpdate(
                "INSERT INTO users (name, email, password, role) " +
                "SELECT 'Admin', 'admin@helpdesk.com', 'admin123', 'admin' " +
                "WHERE NOT EXISTS (SELECT * FROM users WHERE email='admin@helpdesk.com')"
            );

            // Tickets Table
            dbStmt.executeUpdate("CREATE TABLE IF NOT EXISTS tickets ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "title VARCHAR(200),"
                    + "description TEXT,"
                    + "priority VARCHAR(20),"
                    + "status VARCHAR(20),"
                    + "user_id INT,"
                    + "assigned_to INT)");

            // Comments Table
            dbStmt.executeUpdate("CREATE TABLE IF NOT EXISTS comments ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY,"
                    + "ticket_id INT,"
                    + "user_id INT,"
                    + "message TEXT)");

            System.out.println("Database and tables created successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
