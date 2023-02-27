package com.bc.bodycoding.admin.gym;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class GymController {

   @Autowired
   GymService gymdao;
   
   //지점리스트
   @RequestMapping("/gymadminlist.do")
   public String gym1(Model model) {
      model.addAttribute("gymList", gymdao.select());
      return "admin/gym/gymList";
   }   
   //상세보기
   @RequestMapping("/gymdetail.do")
   public String gym7(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
      gymDTO = gymdao.selectOnegym(gymDTO);
      memberDTO = gymdao.selectOneMember(memberDTO);
      model.addAttribute("memList", memberDTO);
      model.addAttribute("dto", gymDTO);
      
      return "admin/gym/gymDetail";
   }
   
   //지점 등록페이지로 이동
   @RequestMapping(value="/gymRegist.do", method=RequestMethod.GET)
   public String  registASUB(Model model) {
      model.addAttribute("mem_type","admin_sub");
      return "admin/gym/gymRegist";
   }
   
   //지점 등록 폼 받아서 등록
   @RequestMapping(value="/gymRegist.do", method=RequestMethod.POST)
   @Transactional
   public String registASUB2(MemberDTO memberDTO, GymDTO gymDTO, HttpServletRequest req) {
	   try {
		   int size = 1024 * 1024 * 10;
           String path = ResourceUtils
          		 .getFile("classpath:static/uploads/gym")
          		 .toPath().toString();
           System.out.println("지점 상세이미지 저장경로 :"+ path);
           MultipartRequest multi = new MultipartRequest(req, path,
                 size, "UTF-8", new DefaultFileRenamePolicy());
           
           Enumeration files = multi.getFileNames();
           String str = (String)files.nextElement();
           
         int count = gymdao.codeCheck(multi.getParameter("gym_code"));
         if(count==1) { 
            System.out.println("이미 등록된 지점입니다.");
            return "admin/gym/gymRegist";
         }
         else {
             memberDTO.setMem_id(multi.getParameter("mem_id"));
 			 memberDTO.setMem_pass(multi.getParameter("mem_pass"));
 			 memberDTO.setMem_name(multi.getParameter("mem_name"));
 			 memberDTO.setMem_phone(multi.getParameter("mem_phone"));
 			 memberDTO.setMem_address(multi.getParameter("mem_address"));
 			 memberDTO.setGym_code(multi.getParameter("gym_code"));
 			 memberDTO.setMem_comment(multi.getParameter("mem_comment"));
 			 memberDTO.setMem_img(multi.getOriginalFileName(str));
 			 System.out.println("파일 업로드 성공");
         }
      } 
      catch (Exception e) {
         e.printStackTrace();
         System.out.println("등록 실패했습니다.");
         return "redirect:/gymRegist.do";
      }
      int result1 = gymdao.insertMember1(memberDTO);
      int result = gymdao.insertMemberASUB(memberDTO);
      if(result==1) System.out.println("등록이 완료되었습니다.");
      return "redirect:/gymadminlist.do";
   }
   
   //수정하기
   @RequestMapping(value="/gymedit.do", method=RequestMethod.GET)
      public String gym4(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
      gymDTO = gymdao.selectOnegym(gymDTO);
      memberDTO = gymdao.selectOneMember(memberDTO);
      model.addAttribute("dto", gymDTO);
      model.addAttribute("memList", memberDTO);
      System.out.println(gymDTO);
      System.out.println(memberDTO);
      return "admin/gym/gymEdit";
   }
   @RequestMapping(value="/gymedit.do", method=RequestMethod.POST)
   public String gym5(GymDTO gymDTO, MemberDTO memberDTO) {
	   int result = gymdao.update(gymDTO);
//	   int result1 = gymdao.updateM(memberDTO);
       if(result==1) System.out.println("수정되었습니다.");
       return "redirect:/gymadminlist.do";
   }
   
   //삭제
   @RequestMapping("/gymdelete.do")
   public String gym6(GymDTO gymDTO, MemberDTO memberDTO) {
      int result1 = gymdao.deleteM(memberDTO);
      int result = gymdao.delete(gymDTO);
      if(result==1) System.out.println("삭제되었습니다.");
      return "redirect:/gymadminlist.do";
   }
   
   
   
}