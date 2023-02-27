//package com.bc.bodycoding;
//
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.crypto.factory.PasswordEncoderFactories;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration {
//	
//	 @Bean
//	 public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfiguration) throws Exception 
//	 {
//		 return authConfiguration.getAuthenticationManager();   
//	 }
//	
//	@Bean
//	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//       http.csrf().disable();
//		http.authorizeRequests()
//            .antMatchers("/**").permitAll()
//            .antMatchers("/css/**", "/js/**", "/images/**").permitAll()
//			.antMatchers("/admin/**").hasAnyRole("ADMIN_SUPER","ADMIN_SUB")
//			.antMatchers("/admin/gym/gymRegist").hasRole("ADMIN_SUPER")		
//			.antMatchers("/admin/gym/gymEdit").hasRole("ADMIN_SUB")		
//			.antMatchers("/admin/trainer/trainerRegist", "/admin/trainer/trainerEdit").hasRole("ADMIN_SUB")	
//			.antMatchers("/admin/product/pEdit").hasRole("ADMIN_SUB")	
//			.antMatchers("/admin/product/sockList").hasRole("ADMIN_SUB")
//			.antMatchers("/admin/product/pReigst").hasRole("ADMIN_SUPER")
//			.antMatchers("/admin/매출관리/**").hasRole("ADMIN_SUPER")	
//			.antMatchers("/admin/Q&A/qnaList", "/admin/Q&A/qnaDetail").hasAnyRole("ADMIN_SUPER", "ADMIN_SUB")		
//			.antMatchers( "/admin/Q&A/qnaAnswer").hasRole("ADMIN_SUB");	
//		
//		http.formLogin()
//			.loginPage("/login.do")
//			.loginProcessingUrl("/loginAction.do")
//			.defaultSuccessUrl("/login.do")
//			.usernameParameter("mem_id")
//			.passwordParameter("mem_pass")
//			.permitAll();
//		
//		http.logout()
//			.logoutUrl("/logout.do")
//			.logoutSuccessUrl("/")
//			.permitAll();
//		
//		http.exceptionHandling()
//			.accessDeniedPage("/denied.do");
//		
//		http.csrf().disable();
//		
//        return http.build();
//    }
//	
//	@Autowired
//	private DataSource dateDataSource;
//	
//	 @Autowired
//	   protected void configure(AuthenticationManagerBuilder auth)
//	   			throws Exception{
//		   auth.jdbcAuthentication()
//		   		.dataSource(dateDataSource)
//		   		.usersByUsernameQuery("select user_id, user_pw, enabled"
//		   				+" from security_admin where user_id = ?")
//		   		.authoritiesByUsernameQuery("select user_id, authority "
//		   				+" from security_admin where user_id = ?")
//		   		.passwordEncoder(passwordEncoder());
//	   }
//	 public PasswordEncoder passwordEncoder() {
//	     return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	 }
//}
