package com.bc.bodycoding;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfiguration) throws Exception {
		return authConfiguration.getAuthenticationManager();
	}

	// 요청명에 관한 권한 설정
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/css/**", "/js/**", "/images/**", "/assets/**").permitAll()
			.antMatchers("/gymadminlist.do").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 		//지점리스트 접근
			.antMatchers("/admin/gym/gymRegist").hasRole("ADMIN_SUPER") 					//지점 등록 접근
			.antMatchers("/admin/gym/gymEdit").hasRole("ADMIN_SUB") 						//지점 수정 접근 ( + 본인의 지점만 수정가능)
			.antMatchers("/admin/trainer/trainerRegist").hasRole("ADMIN_SUB") 				//트레이너 등록 접근
         	.antMatchers("/admin/trainer/trainerEdit").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 				// 트레이너 수정 접근( + 본인 소속만 수정가능)
			.antMatchers("/admin/product/productReigst").hasRole("ADMIN_SUPER") 			//상품 등록 접근
         	.antMatchers("/admin/product/productEdit").hasRole("ADMIN_SUPER") 				// 상품 수정 접근
			.antMatchers("/admin/product/stockList").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") //재고 리스트 접근
			.antMatchers("/boardList.do").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 			//게시판 리스트 접근
			.antMatchers("/boardDetail.do").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 			//게시판 상세페이지 접근
			//게시글 수정 페이지 접근
			.antMatchers("/noticeList.do").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 			//공지사항 리스트 접근
			.antMatchers("/noticeDetail.do").hasAnyRole("ADMIN_SUB", "ADMIN_SUPER") 		//공지사항 상세페이지 접근
			//공지사항 작성 페이지 접근
			//공지사항 수정 페이지 접근
			.antMatchers("/admin/**").hasAnyRole("ADMIN_SUPER", "ADMIN_SUB") 
			.antMatchers("/**").permitAll()
//         	.antMatchers("/admin/매출관리/**").hasRole("ADMIN_SUPER")
//         	.antMatchers("/admin/Q&A/qnaAnswer").hasRole("ADMIN_SUB")
			.anyRequest().authenticated();

		// 로그인 페이지 커스터마이징
		http.formLogin()
			.loginPage("/main/admin")
			.loginProcessingUrl("/adminLoginAction.do")
			.defaultSuccessUrl("/main/admin")
			.failureUrl("/adminLoginError.do")
			.usernameParameter("mem_id")
			.passwordParameter("mem_pass")
			.permitAll();

		// 로그아웃에 관한 커스터 마이징
		http.logout()
			.logoutUrl("/adminLogout.do")
			.logoutSuccessUrl("/")
			.permitAll();

		// 권한 부족할 경우
		http.exceptionHandling()
			.accessDeniedPage("/denied.do");

		// ssl을 사용하지 않으면 true로 사용?
		http.csrf().disable();

		return http.build();
	}

	@Autowired
	private DataSource dataSource;

	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select mem_id, mem_pass, enabled from member where mem_id=?")
				.authoritiesByUsernameQuery("select mem_id, authority from member where mem_id=?")
				.passwordEncoder(passwordEncoder());
	}

	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}