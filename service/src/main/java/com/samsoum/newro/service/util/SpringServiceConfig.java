package com.samsoum.newro.service.util;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {
		"com.samsoum.newro.service", 
		"com.samsoum.newro.binding", 
		"com.samsoum.newro.persistence"
		})
public class SpringServiceConfig {

}