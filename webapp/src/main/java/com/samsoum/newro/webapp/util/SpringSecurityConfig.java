package com.samsoum.newro.webapp.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.samsoum.newro.service.UserService;
import com.samsoum.newro.webapp.security.MyAuthenticationEntryPoint;

@EnableWebSecurity
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
	private UserService userService;
	
	@Autowired
    private MyAuthenticationEntryPoint authenticationEntryPoint;
	
	@Autowired
	public SpringSecurityConfig(UserService userService) {
		this.userService = userService;
	}
	
    @Bean 
    public PasswordEncoder passwordEncoder() { 
        return new BCryptPasswordEncoder(); 
    }
    
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }
    
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
		  .csrf().disable()
		  .authorizeRequests()
		  .antMatchers("/login*").permitAll()
		  .anyRequest().authenticated()
	      .and()
	      .formLogin()
	      .loginPage("/login")
	      .loginProcessingUrl("/perform_login")
	      .defaultSuccessUrl("/dashboard", true)
	      .failureUrl("/login?error=true")
	      .permitAll()
	      .and()
          .httpBasic()
          .authenticationEntryPoint(authenticationEntryPoint);
    }
}
