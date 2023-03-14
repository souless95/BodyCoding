package com.bc.bodycoding;


import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.bodycoding.admin.chart.SalesChartController;
import com.bc.bodycoding.admin.chart.SalesChartService;

import global.dto.MemberDTO;
import global.dto.ProductDTO;


@Controller
public class MainController {
	
	@RequestMapping("account/myinfo")
	public String myinfo() {
		return "account/myinfo";
	}
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}	
	
	//adimin메인창으로 넘어가기
//	@GetMapping("/main/admin")
//	public String adminmain(HttpSession session) {
//		return "admin/main";
//	}
	
//	//admin Login 창으로 먼저 슝
	@RequestMapping("login")
	public String adminLogin(HttpSession session) {
		return "admin/login";
	}
	
	//회원메인창으로 넘어가기
	@GetMapping("main")
	public String membermain(HttpSession session) {
		session.getAttribute("UserName");
		return "member/main";
	}
	
	@RequestMapping("gx")
	public String gx() {
		return "member/menu/gx";
	}
	@RequestMapping("health")
	public String health() {
		return "member/menu/health";
	}
	@RequestMapping("introgym")
	public String introgym() {
		return "member/menu/introgym";
	}
	@RequestMapping("pila")
	public String pila() {
		return "member/menu/pila";
	}
	@RequestMapping("pt")
	public String pt() {
		return "member/menu/pt";
	}
	@RequestMapping("yoga")
	public String yoga() {
		return "member/menu/yoga";
	}
	
	@Autowired
	SalesChartService salesChartdao;
	//시큐리티 로그인용
	@RequestMapping("/main/admin")
	public String adminLogin(Principal principal, Model model, MemberDTO memberDTO) {
		SalesChartController controller = new SalesChartController();
		
			try {
				String mem_id = principal.getName();
				model.addAttribute("mem_id", mem_id);
				
				//sup 보여주기
				model.addAttribute("totalgym_totalsales",salesChartdao.totalgym_totalsales());
//				System.out.println(salesChartdao.totalgym_totalsales());
				//현재 활성화되어있는 지점코드
				List<String> gymList = salesChartdao.enabledGym();
				//모든 지점에 대해 월별 매출액 구하기
				Map<String, List<ProductDTO>> gym_sales = new TreeMap<>();
				for(int i=0; i<gymList.size() ; i++) {
					System.out.println(gymList.get(i));
					List<ProductDTO> selectgymList = salesChartdao.gym_sales(gymList.get(i));
					System.out.println(selectgymList.toString());
					if(selectgymList.toString().length() != 2) {
						gym_sales.put(selectgymList.get(0).getMem_id(), salesChartdao.gym_sales(gymList.get(i)));
					}
				}
				model.addAttribute("gym_sales", gym_sales);
				System.out.println(gym_sales);
				
				//sub 보여주기
				System.out.println(mem_id);
				MemberDTO gymInfo = salesChartdao.gym_code(mem_id);
				if(gymInfo != null) {
					System.out.println(gymInfo);
					String gym_code =gymInfo.getGym_code();
					System.out.println("222");
					String mem_name = gymInfo.getMem_name();
					System.out.println("33");
					model.addAttribute("mem_name", mem_name);
					System.out.println("지점코드: "+gym_code);
					//로그인된 아이디의 지점에 대한 정보: 모든 상품에 대한 월별 매출
					model.addAttribute("totalcategory_totalsales", salesChartdao.totalcategory_totalsales(gym_code));
					//로그인된 아이디의 지점에 대한 정보: 각 상품에 대한 월별 매출
					ProductDTO productDTO = new ProductDTO();
					String[] product_category_name = {"GX","헬스","필라테스","PT","요가"};
					String[] product_category = {"gx","health","pilates","pt","yoga"};
					System.out.println(product_category_name.length);
					for(int i=0; i<product_category_name.length ; i++) {
						productDTO.setProduct_category(product_category_name[i]);
						productDTO.setGym_code(gym_code);
						model.addAttribute(product_category[i]+"_sales", salesChartdao.category_sales(productDTO));
					}
				}
				
				return "admin/main";
			} 
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("로그인하셔야 합니다.");
				return "admin/auth/login";
			}
	}
	
	//로그인 실패한 경우 출력할 메세지
	@RequestMapping("/adminLoginError.do")
	public String adminLogin2(Model model) {
		model.addAttribute("errorMsg", "로그인에 실패했습니다.");
		return "admin/auth/login";
	}
	
	//권한이 부족한 경우 출력할 메세지
	@RequestMapping("/denied.do")
	public String adminLogin3() {
		return "admin/auth/denied";
	}
	//권한이 부족한 경우 출력할 메세지
	@RequestMapping("star")
	public String star() {
		return "member/star";
	}
}
