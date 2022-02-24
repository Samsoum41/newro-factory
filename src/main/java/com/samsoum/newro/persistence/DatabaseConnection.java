package com.samsoum.newro.persistence;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.samsoum.newro.util.UtilitaireProgram;

public class DatabaseConnection {
    private Connection con;
    String URL;
    String USERNAME;
    String PASSWORD;
    
    private DatabaseConnection()
    {
    	try(InputStream propertiesFile = new FileInputStream(UtilitaireProgram.WORKING_PATH + "src/main/resources/config.properties")) {
        	Properties prop = new Properties();
        	prop.load(propertiesFile);
        	URL = prop.getProperty("db.url");
        	USERNAME = prop.getProperty("db.username");
        	PASSWORD = prop.getProperty("db.password");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        catch(FileNotFoundException e) {
        	e.printStackTrace();
        }
        catch(IOException e) {
        	e.printStackTrace();
        }
    }
    public static Connection getConnection()
    { 
        return new DatabaseConnection().con;
    }
}
