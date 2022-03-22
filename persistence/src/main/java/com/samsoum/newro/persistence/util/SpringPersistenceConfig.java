package com.samsoum.newro.persistence.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class SpringPersistenceConfig {
	@Bean
	public DataSource dataSource() throws IOException {
		HikariConfig config = new HikariConfig();
		HikariDataSource ds;
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource("config.properties").getFile());
		InputStream propertiesFile = new FileInputStream(file.getAbsoluteFile());
		Properties prop = new Properties();
		prop.load(propertiesFile);
		config.setJdbcUrl(prop.getProperty("db.url"));
		config.setUsername(prop.getProperty("db.username"));
		config.setPassword(prop.getProperty("db.password"));
		config.setDriverClassName(prop.getProperty("db.driverClassName"));
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		ds = new HikariDataSource(config);
		return ds;
	}

	@Bean
	public NamedParameterJdbcTemplate namedJdbcTemplate() throws IOException {
		return new NamedParameterJdbcTemplate(dataSource());
	}

	@Bean
	public JdbcTemplate jdbcTemplate() throws IOException {
		return new JdbcTemplate(dataSource());
	}
}
