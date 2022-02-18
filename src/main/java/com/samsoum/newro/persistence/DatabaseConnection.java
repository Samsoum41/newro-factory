package com.samsoum.newro.persistence;

import java.sql.*;

public class DatabaseConnection {
    private static Connection con = null;
    
    static
    {
        String url = "jdbc:mysql:// localhost:3306/newro-factory-db";
        String username = "adminnewro";
        String password = "qwerty1234";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection()
    {
        return con;
    }
}
