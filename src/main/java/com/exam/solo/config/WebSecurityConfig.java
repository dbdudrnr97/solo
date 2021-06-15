package com.exam.solo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception { // 제외될 자원설정
		web.ignoring().antMatchers("/resources/**");  //자원파일들 접근허용
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception { // 인증,권한
		http.authorizeRequests()
			.antMatchers("/member/**").authenticated()
			.antMatchers("/").permitAll(); // index페이지 모두허용
		
		http.formLogin()
			.loginPage("/member/memberLogin.do") // 로그인페이지요청 GET
			.loginProcessingUrl("/member/memberLogin.do") // 로그인처리요청 POST
			.usernameParameter("uid")
			.passwordParameter("upwd")
			.defaultSuccessUrl("/")
			.permitAll();
	}

	
}
