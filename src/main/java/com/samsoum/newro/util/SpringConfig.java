package com.samsoum.newro.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebMvc
@ComponentScan("com.samsoum.newro")
public class SpringConfig implements WebMvcConfigurer {

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

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
}
