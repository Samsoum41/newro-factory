package com.samsoum.newro.binding.config;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Context {
	private static ApplicationContext context;
	private Context() {
		context = new AnnotationConfigApplicationContext(SpringBindingConfig.class);
	}
	public static ApplicationContext getInstance() {
		if (context == null) {
			new Context();
		}
		return context;
	}
}
