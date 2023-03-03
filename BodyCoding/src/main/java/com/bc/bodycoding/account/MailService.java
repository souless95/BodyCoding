package com.bc.bodycoding.account;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import global.dto.MemberDTO;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class MailService {
	
    private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "skenwl31@naver.com";

    public void mailSend(MemberDTO memberDTO) {
    	
    	String newpass = memberDTO.getMem_pass();
    	String email = memberDTO.getMem_id();
    	
    	System.out.println("메일 서버에서 값 찍기");
    	System.out.println(newpass);
    	System.out.println(email);
    	
    	try {
           MailHandler mailHandler = new MailHandler(mailSender);
            
            // 받는 사람
           mailHandler.setTo("skenwl31@naver.com");
          
            // 보내는 사람
           mailHandler.setFrom(MailService.FROM_ADDRESS);
           
            // 제목
           //mailHandler.setSubject(memberDTO.getTitle());
           mailHandler.setSubject("새로운 임시밀번호 발송 메일입니다.1111");
            // HTML Layout
            //String htmlContent = "<p>" + memberDTO.getMessage() +"<p> <img src='cid:sample-img'>";
           String htmlContent = "새로운 비밀번호는" + newpass + "입니다." +"<br>" + memberDTO.getMessage() 
        		   				+ "새로운 비밀번호로 로그인 해주세요";
           
            mailHandler.setText(htmlContent, true);

            // 첨부 파일 정상작동되어서 주석
           //mailHandler.setAttach("newTest.txt", "static/assets/samplefile.txt");
            // 이미지 삽입 정상작동되어서 주석
           //mailHandler.setInline("sample-img", "static/assets/images/sample.jpg");

            mailHandler.send();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

	public void setFrom(String email) {
		
	}
}
