package com.bc.bodycoding.purchase;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ProductDTO;

@Controller
public class PurchaseController {
	
	@Autowired
	IPurchaseService purchaseDao;
	
	@RequestMapping("/membershipPurchase.do")
	public String purchaseHome(Model model) {
		model.addAttribute("gymList",purchaseDao.gymSelect());
		return "/member/purchase/purchase";
	}
	
	@ResponseBody
	@RequestMapping("/productLoad.do")
	public List<ProductDTO> productLoad(ProductDTO productDTO) {
		List<ProductDTO> pList;
		pList = purchaseDao.productSelect(productDTO);
		return pList;
	}
	
	@ResponseBody
	@RequestMapping("/trainerLoad.do")
	public List<ProductDTO> trainerLoad(HttpServletRequest req) {
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setGym_code(req.getParameter("gym_code"));
		productDTO.setLesson_category(req.getParameter("lesson_category"));
		
		List<ProductDTO> tList;
		tList = purchaseDao.trainerSelect(productDTO);
		return tList;
	}
	
	@ResponseBody
	@RequestMapping("/kakaoPay.do")
	public String purchase() {
		try {			
			//요청 url 생성
			URL payUrl = new URL("https://kapi.kakao.com/v1/payment/ready");
			
			//커넥션 객체 생성
			HttpURLConnection payUrlCon = (HttpURLConnection)payUrl.openConnection();

			
			//커넥션 속성 정의
			payUrlCon.setRequestMethod("POST");
			payUrlCon.setRequestProperty("Authorization", "KakaoAK 7d45b2df603f1ea51e68adab42d4e5e9");
			payUrlCon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			//Input : 돌려받을 값이 있는지, 기본적으로 HttpURLConnection 객체 생성 시, true로 설정
			//Output : 보낼 값이 있는지, 기본적으로 false라서 있다면 true로 설정 필요
			payUrlCon.setDoOutput(true);
			
			//전송할 파라미터 정의
			String kParam = "cid=TC0ONETIME"
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=초코파이"
					+ "&quantity=1"
					+ "&total_amount=2200"
					+ "&tax_free_amount=0"
					+ "&approval_url=http://localhost:8586/purchaseApproval.do"
					+ "&fail_url=http://localhost:8586/purchaseFail.do"
					+ "&cancel_url=http://localhost:8586/purchaseFail.do";
			
			
			
			OutputStream oStream = payUrlCon.getOutputStream();
			DataOutputStream dataStream = new DataOutputStream(oStream);
			dataStream.writeBytes(kParam);
			dataStream.close();
			
			int result = payUrlCon.getResponseCode();
			

			
			InputStream iStream;
			
			if(result==200) {
				iStream = payUrlCon.getInputStream();
			}
			else {
				iStream = payUrlCon.getErrorStream();
			}
			
			InputStreamReader reader = new InputStreamReader(iStream);
			
			
			BufferedReader bReader = new BufferedReader(reader);
			return bReader.readLine();
		} 
		catch (MalformedURLException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/purchaseApproval.do")
	public String purchaseApproval() {
		return "/member/purchase/purchaseApproval";
	}
	
	@RequestMapping("/purchaseFail.do")
	public String purchaseFail() {
		return "/member/purchase/purchaseFail";
	}
	
	@RequestMapping("/purchaseCancel.do")
	public String purchaseCancel() {
		return "/member/purchase/purchaseCancel";
	}
	
}
