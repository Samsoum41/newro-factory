package com.samsoum.newro.persistence;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
    private Connection con;
    String URL;
    String USERNAME;
    String PASSWORD;
    
    private DatabaseConnection()
    {
    	ClassLoader classLoader = getClass().getClassLoader();
    	File file = new File(classLoader.getResource("config.properties").getFile());
    	try(InputStream propertiesFile = new FileInputStream(file.getAbsoluteFile())) {
        	Properties prop = new Properties();
        	prop.load(propertiesFile);
        	URL = prop.getProperty("db.url");
        	USERNAME = prop.getProperty("db.username");
        	PASSWORD = prop.getProperty("db.password");
            Class.forName(prop.getProperty("db.driverClassName"));
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
