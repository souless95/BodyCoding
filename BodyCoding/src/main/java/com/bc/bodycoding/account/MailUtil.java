package com.bc.bodycoding.account;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	
	public static void sendMail(String email, String subject, String msg) throws Exception{
		
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";	//SMTP서버명
		String hostSMTPid = "skenwl31@naver.com";	//아이디
		String hostSMTPpwd = "Tjsqb11s1";	//비밀번호
		
		//보내는 사람
		
		String fromEmail = "skenwl31@naver.com";
		String fromName = "현이";
		
		//email 전송
		
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587); 		//SMTP포트번호
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);	//TLS사용
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
