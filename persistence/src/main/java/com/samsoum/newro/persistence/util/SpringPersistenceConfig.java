package com.samsoum.newro.persistence.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableJpaRepositories(basePackages = {"com.samsoum.newro.persistence.repositories.jpa"})
@EnableTransactionManagement
@ComponentScan(basePackages = "com.samsoum.newro.binding.persistence.mapper")
public class SpringPersistenceConfig {
	String ENTITY_PACKAGE_TO_SCAN = "com.samsoum.newro.binding.persistence.dto";
	
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

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() throws IOException {
		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		vendorAdapter.setGenerateDdl(false);
		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setJpaVendorAdapter(vendorAdapter);
		factory.setPackagesToScan(ENTITY_PACKAGE_TO_SCAN);
		factory.setDataSource(dataSource());
		return factory;
	}

	@Bean
	public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager txManager = new JpaTransactionManager();
		txManager.setEntityManagerFactory(entityManagerFactory);
		return txManager;
	}
}
