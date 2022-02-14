package data;

import java.sql.*;

public class Test {
    public static void main(String args[])
            throws SQLException, ClassNotFoundException
        {
            String driverClassName
                = "com.mysql.cj.jdbc.Driver";
            String url = "localhost/newro-factory-db";
            String url2 = "jdbc:mysql://localhost/newro-factory-db";
            String username = "adminnewro";
            String password = "qwerty1234";
            String query
                = "SELECT * FROM stagiaire;";
      
            // Load driver class
            Class.forName(driverClassName);
      
            // Obtain a connection
            Connection con = DriverManager.getConnection(
                url2, username, password);
      
            // Obtain a statement
            Statement st = con.createStatement();
      
            // Execute the query
            ResultSet res = st.executeQuery(query);
            while (res.next()) {
                System.out.println(res.getInt(1));

            }
      
            // Closing the connection as per the
            // requirement with connection is completed
            con.close();
        }
}
