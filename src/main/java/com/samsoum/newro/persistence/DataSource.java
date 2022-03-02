package com.samsoum.newro.persistence;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class DataSource {
    private HikariConfig config = new HikariConfig();
    private HikariDataSource ds;
    public static DataSource instance;
    
    private DataSource()
    {
    	ClassLoader classLoader = getClass().getClassLoader();
    	File file = new File(classLoader.getResource("config.properties").getFile());
    	try(InputStream propertiesFile = new FileInputStream(file.getAbsoluteFile())) {
        	Properties prop = new Properties();
        	prop.load(propertiesFile);
        	config.setJdbcUrl(prop.getProperty("db.url"));
        	config.setUsername(prop.getProperty("db.username"));
        	config.setPassword(prop.getProperty("db.password"));
            config.setDriverClassName(prop.getProperty("db.driverClassName"));
            config.addDataSourceProperty( "cachePrepStmts" , "true" );
            config.addDataSourceProperty( "prepStmtCacheSize" , "250" );
            config.addDataSourceProperty( "prepStmtCacheSqlLimit" , "2048" );
            ds = new HikariDataSource(config);
        }
        catch ( IOException e) {
            e.printStackTrace();
        }
    }
    
    public static DataSource getInstance() {
    	if (instance==null) {
    		instance = new DataSource();
    	}
    	return instance;
    }
    public Connection getConnection() throws DAOException
    { 
    	try {
            return ds.getConnection();
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
    		throw new DAOException();
    	}
    }
}
