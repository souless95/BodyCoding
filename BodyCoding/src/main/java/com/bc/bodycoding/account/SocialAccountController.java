package com.bc.bodycoding.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.dto.MemberDTO;


@Controller
public class SocialAccountController {

	@Autowired
	AccountService socialdao;
	
	//카카오톡 로그인
		@GetMapping("/callback")
		public String kakaocallback(@RequestParam String code, HttpSession session, Model model) {
			//post방식으로 key=value 데이터를 요청(카카오쪽으로)
			RestTemplate rt = new RestTemplate();
			
			//HttpHeaders 오브젝트 생성
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
			
			//HttpBody 오브젝트 생성
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "a7d2784fba5cd05b34f27b173250d1b7");
			params.add("redirect_uri", "http://localhost:8586/callback");
			params.add("code", code);
			
			//HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);
			
			//Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
			);
			
			/*
			 Json객체를 OAuthToken클래스의 객체 타입으로 변경해준다.
			 Gson,Json Simple,ObjectMapper 라이브러리로 코드를 생성할수있다.
			여기서는 ObjectMapper를 사용
			*/
			ObjectMapper objectMapper = new ObjectMapper();
			//토큰명
			OAuthToken oauthToken = null;
			try {
				//response.getBody()이 json형식이므로 나온값을 OAuthToken형식으로 읽어줌
				oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			//콘솔에는 string으로 보임
			System.out.println("카카오 엑세스 토큰:"+ oauthToken.getAccess_token());
			
			
			//여기서 return하면 토큰과 토큰관련 정보들이 json객체로 나온다.
//			return response.getBody();
			
			
			
			
			//토큰을 이용해서 사용자 정보 가져오기
			
			RestTemplate rt2 = new RestTemplate();
			
			//HttpHeaders 오브젝트 생성
			HttpHeaders headers2 = new HttpHeaders();
			headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
			headers2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
			
			//HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);
			
			//Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
			);
			
			System.out.println(response2.getBody());
			
			
			//Json객체를 OAuthToken클래스의 객체 타입으로 변경해준다.
			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile = null;
			try {
				kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			//User 오브젝트: email, password,
			System.out.println("카카오 아이디(번호):"+kakaoProfile.getId());
//			System.out.println("카카오 이메일:"+kakaoProfile.getKakao_account().getEmail());
			System.out.println("카카오 성별:"+kakaoProfile.getKakao_account().getGender());
//			System.out.println("카카오 생일:"+kakaoProfile.getKakao_account().getBirthday());
			
			
			String mem_id = kakaoProfile.getId().toString()+"@kakao.com(kakao)";
			String mem_gender =null;
			if(kakaoProfile.getKakao_account().getGender().equals("female")) {
				mem_gender = "F";
			}
			else if(kakaoProfile.getKakao_account().getGender().equals("male")) {
				mem_gender = "M";
			}
			else{
				mem_gender = "";
			}
			
			//바디코딩에 이미 회원가입되어있는지 찾기(이미 등록되어있는 아이디의 회원이름 mem_name)
			String mem_name = socialdao.kakaoselect(mem_id);
			MemberDTO info = socialdao.kakaoinfoselect(mem_id);
			System.out.println(mem_name);
			if(mem_name==null) {
				System.out.println("회원이 아니므로 회원가입을 진행합니다.");
				//카카오톡 회원가입
				Map<String, String> kakaoregister = new HashMap<String, String>();
				kakaoregister.put("mem_id",mem_id );
				kakaoregister.put("mem_gender", mem_gender);
				int result_kakao = socialdao.kakaoinsert(kakaoregister);
				model.addAttribute("UserEmail",mem_id);
				model.addAttribute("gymList", socialdao.gymlistSelect());
//				session.setAttribute("UserInfo", UserInfo);
//				session.setAttribute("UserName", mem_name);
				return "member/account/kakaoLogin";
			}
			
			else {
				session.setAttribute("UserInfo", info);
				session.setAttribute("Authority", info.getAuthority());
				System.out.println("elese후"+mem_name);
//				session.setAttribute("UserInfo", socialdao.kakaoUserInfo(mem_id));
				session.setAttribute("UserName", mem_name);
				session.setAttribute("UserEmail", mem_id);
				session.setAttribute("UserPoint", info.getMem_point());
				return "redirect:main"; 
			}
			
		}
		
		//카카오 추가등록
		@PostMapping("/kakaoregist.do")
		public String kakaoregist(MemberDTO memberDTO, HttpSession session) {
			int resultkakao = socialdao.kakaoupdate(memberDTO);
			if(resultkakao==1) {
				System.out.println("카카오 정보 추가등록 완료");
			}
			session.setAttribute("UserName", memberDTO.getMem_name());
			session.setAttribute("UserEmail", memberDTO.getMem_id());
			session.setAttribute("UserEmail", memberDTO.getAuthority());
			return "redirect:main";
		}
		
}
