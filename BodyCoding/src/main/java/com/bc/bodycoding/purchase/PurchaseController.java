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
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import global.dto.ProductDTO;

@Controller
@SessionAttributes({ "mem_id", "trainer_id", "product_idx", "gym_code", "product_name", "use_point", "product_count",
		"type","product_price" })
public class PurchaseController {

	@Autowired
	IPurchaseService purchaseDao;

	@RequestMapping("/membershipPurchase.do")
	public String purchaseHome(HttpServletRequest req, Model model) {

		HttpSession session = req.getSession();

		String mem_id = (String) session.getAttribute("UserEmail");

		model.addAttribute("mem_id", mem_id);
		System.out.println(mem_id);
		model.addAttribute("gymList", purchaseDao.gymSelect());
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
	public String purchase(HttpServletRequest req, Model model, HttpSession session, ProductDTO productDTO) {
		
		System.out.println(productDTO);

		// ???????????? ?????? ?????? ?????? ??????
		String type = req.getParameter("type");
		String product_name = productDTO.getProduct_name();
		int product_price = productDTO.getProduct_price();
		System.out.println(product_price);
		String mem_id = session.getAttribute("UserEmail").toString();
		String product_count;
		int tCount = 0;

		// ???????????? ?????? ???????????? ????????? ????????? ??????
		model.addAttribute("type", type);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("product_idx", productDTO.getProduct_idx());
		model.addAttribute("product_price", product_price);

		// ???????????? ?????? ????????? ????????? ??????
		if (type.equals("?????????")) {
			if(productDTO.getTrainer_id()==null) {
				model.addAttribute("trainer_id", "");
			}
			else {
				model.addAttribute("trainer_id", productDTO.getTrainer_id());
			}
			model.addAttribute("gym_code", productDTO.getGym_code());
			model.addAttribute("use_point", "");
			model.addAttribute("product_count", "");
			product_count = "1";

		}
		// ????????? ?????? ????????? ????????? ??????
		else {
			model.addAttribute("trainer_id", "");
			model.addAttribute("gym_code", "");
			model.addAttribute("use_point", productDTO.getUse_point());
			model.addAttribute("product_count", productDTO.getProduct_count());

			product_count = productDTO.getProduct_count();

			// ?????? ?????? ?????? 2??? ????????? ??????, ?????? "00??? N???"?????? ??????
			int pInt = product_name.indexOf(",");
			if (!(pInt == -1)) {
				String pList[] = product_name.split(",");
				product_name = pList[0] + "??? " + (pList.length - 1) + "???";
				String cList[] = product_count.split(",");
				for(int i=0; i<cList.length; i++) {
					tCount += Integer.parseInt(cList[i]);
				}
				
				System.out.println("?????? ?????? ??????:" + product_name);
				
			}

		}

		model.addAttribute("product_count", product_count);
		model.addAttribute("product_name", product_name);

		try {
			// ?????? url ??????

			URL payUrl = new URL("https://kapi.kakao.com/v1/payment/ready");

			// ????????? ?????? ??????
			HttpURLConnection payUrlCon = (HttpURLConnection) payUrl.openConnection();

			// ????????? ?????? ??????
			payUrlCon.setRequestMethod("POST");
			payUrlCon.setRequestProperty("Authorization", "KakaoAK 7d45b2df603f1ea51e68adab42d4e5e9");
			payUrlCon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// Input : ???????????? ?????? ?????????, ??????????????? HttpURLConnection ?????? ?????? ???, true??? ??????
			// Output : ?????? ?????? ?????????, ??????????????? false?????? ????????? true??? ?????? ??????
			payUrlCon.setDoOutput(true);

			// ????????? ???????????? ??????
			String kParam = "cid=TC0ONETIME" 
					+ "&partner_order_id=partner_order_id" 
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=" + product_name 
					+ "&quantity=" + tCount 
					+ "&total_amount=" + product_price
					+ "&tax_free_amount=0" 
					+ "&approval_url=http://localhost:8586/purchaseApproval.do"
					+ "&fail_url=http://localhost:8586/purchaseFail.do"
					+ "&cancel_url=http://localhost:8586/purchaseFail.do";
			
			System.out.println(kParam);
			
			OutputStream oStream = payUrlCon.getOutputStream();
			DataOutputStream dataStream = new DataOutputStream(oStream);
			dataStream.writeBytes(kParam);
			dataStream.close();

			int result = payUrlCon.getResponseCode();

			InputStream iStream;

			if (result == 200) {
				iStream = payUrlCon.getInputStream();
			} else {
				iStream = payUrlCon.getErrorStream();
			}

			InputStreamReader reader = new InputStreamReader(iStream);

			BufferedReader bReader = new BufferedReader(reader);

			return bReader.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	@Transactional
	@RequestMapping("/purchaseApproval.do")
	public String purchaseApproval(@ModelAttribute("mem_id") String mem_id,
			@ModelAttribute("trainer_id") String trainer_id, @ModelAttribute("product_idx") String product_idx,
			@ModelAttribute("gym_code") String gym_code, @ModelAttribute("product_name") String product_name,
			@ModelAttribute("use_point") String use_point, @ModelAttribute("product_count") String product_count,
			@ModelAttribute("type") String type, @ModelAttribute("product_price") String product_price,
			Model model){
		
		
		try {
			ProductDTO productDTO = new ProductDTO();

			productDTO.setMem_id(mem_id);
			productDTO.setType(type);
			productDTO.setPay_method("???????????????");

			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			
			result1 = purchaseDao.insertOrder(productDTO);
			
			if (type.equals("?????????")) {

				System.out.println("????????? ?????? ??? DB ?????? ?????? ??????");

				productDTO.setTrainer_id(trainer_id);
				productDTO.setProduct_idx(product_idx);
				productDTO.setGym_code(gym_code);
				
				result2 = purchaseDao.insertMembership(productDTO);
			} 
			else {
				
				System.out.println("?????? ?????? ??? DB ?????? ?????? ??????");

				productDTO.setUse_point(Integer.parseInt(use_point));
				
				String p_idx[] = product_idx.split(",");
				String p_count[] = product_count.split(",");
				
				for (int i = 0; i < p_idx.length; i++) {
					productDTO.setProduct_idx(p_idx[i]);
					productDTO.setProduct_count(p_count[i]);
					productDTO.setProduct_serial_num(randomNum());
					result2 = purchaseDao.insertOrderDetail(productDTO); 
					
					System.out.println("for???");
				}		
				
			}
			
			if(use_point=="") {
				use_point="0";
			}
			int final_price = Integer.parseInt(product_price)-Integer.parseInt(use_point);
			int save_point = (int)Math.floor((double)final_price * 0.005);
			productDTO.setTotal_price(Integer.parseInt(product_price));
			productDTO.setFinal_price(final_price);
			productDTO.setSave_point(save_point);
			System.out.println("?????? ??? DB ?????? DTO ?????? : "+productDTO);
			result3 = purchaseDao.insertPayAndUpdatePoint(productDTO);
			
			model.addAttribute("save_point", save_point);
			model.addAttribute("mem_id", mem_id);
			
			if (result1 == 1 && result2 == 1 && result3 == 1) {
				System.out.println("????????????");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("????????????");
		}

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
	
	//?????? ????????? ???????????? ??????
	public String randomNum() {
	  String rNum = "";
	  int idx = 0;
	  char[] charSet = new char[] { 
			  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
			  'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 
			  'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
		 
      for (int i = 0; i < 10; i++) {
    	  idx = (int) (charSet.length * Math.random());
    	  rNum += charSet[idx];
      }
      
      return rNum;
   }
   
}