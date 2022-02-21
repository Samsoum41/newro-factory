package com.samsoum.newro.persistence;

import java.sql.*;

public class DatabaseConnection {
    private Connection con;
    static final String URL = "jdbc:mysql:// localhost:3306/newro-factory-db";
    static final String USERNAME = "adminnewro";
    static final String PASSWORD = "qwerty1234";
    
    private DatabaseConnection()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection()
    { 
        return new DatabaseConnection().con;
    }
}
