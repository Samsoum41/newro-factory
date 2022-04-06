package com.samsoum.newro.webapp.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.context.support.GenericWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

public class MyNeuroInitializer implements WebApplicationInitializer{

//	@Override
//	protected Class<?>[] getRootConfigClasses() {
//		return new Class<?>[] {SpringSecurityConfig.class};
//	}
//
//	@Override
//	protected Class<?>[] getServletConfigClasses() {
//		return new Class[] {SpringWebConfig.class, SpringServiceConfig.class, SpringBindingConfig.class, SpringPersistenceConfig.class};
//	}
//
//	@Override
//	protected String[] getServletMappings() {
//		return new String[] {"/"};
//	}
////	
    @Override
    public void onStartup(ServletContext sc) {

        AnnotationConfigWebApplicationContext root = new AnnotationConfigWebApplicationContext();
        
        root.scan("com.samsoum.newro");
        root.register(SpringSecurityConfig.class);
        sc.addListener(new ContextLoaderListener(root));
        
        ServletRegistration.Dynamic appServlet = 
  	          sc.addServlet("newro", new DispatcherServlet(new GenericWebApplicationContext()));
  	        appServlet.setLoadOnStartup(1);
  	        appServlet.addMapping("/");


        sc.addFilter("securityFilter", new DelegatingFilterProxy("springSecurityFilterChain"))
          .addMappingForUrlPatterns(null, false, "/*");
        
    }

}
