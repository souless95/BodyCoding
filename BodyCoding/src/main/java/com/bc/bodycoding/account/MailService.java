package com.bc.bodycoding.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import global.dto.MemberDTO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	
	@Autowired
	AccountService accountdao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	//보내는 사람의 이메일 application.properties에서 설정한 계정과 동일해야한다.
    private static final String FROM_ADDRESS = "skenwl31@naver.com";

    public void mailSend(MemberDTO memberDTO) {
    	
    	String newpass = memberDTO.getMem_pass();
    	String mem_id = memberDTO.getMem_id();
    	System.out.println(newpass);
    	
    	try {
           MailHandler mailHandler = new MailHandler(mailSender);
            
            // 받는 사람
           mailHandler.setTo(mem_id);
          
            // 보내는 사람
           mailHandler.setFrom(MailService.FROM_ADDRESS);
           
           // 제목
           //mailHandler.setSubject(memberDTO.getTitle());
           mailHandler.setSubject("새로운 임시비밀번호 발송 메일입니다.");

           // HTML Layout
           //String htmlContent = "<p>" + memberDTO.getMessage() +"<p> <img src='cid:sample-img'>";
           String htmlContent = "새로운 비밀번호는 '" + newpass + "' 입니다." +"<br>" 
        		   				+ "새로운 비밀번호로 로그인 해주세요.";
           
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
}
