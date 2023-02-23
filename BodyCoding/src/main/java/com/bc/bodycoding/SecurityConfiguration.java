//package com.bc.bodycoding;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration {
//	
//	@Bean
//	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//       http.csrf().disable();
//		http
//            .authorizeRequests()
//            .antMatchers("/**").permitAll()
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
//        return http.build();
//    }
//}
