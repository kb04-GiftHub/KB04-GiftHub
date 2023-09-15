package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	// 가맹점
	@GetMapping("/store/mypage/check_pwd")
	public String check_pwd(HttpSession session) {
		if(session.getAttribute("loggedStoreId") == null || session.getAttribute("loggedMemberId") != null) {
			return "redirect:/index";
		}
		
		return "mypage/store_check_pwd";
	}
	
	@PostMapping("/store/mypage/check_action")
	public String check_action(@RequestParam String password,
			Model model, RedirectAttributes redirect, HttpSession session) {
		String loggedStoreId = (String)session.getAttribute("loggedStoreId");
		StoreDto storeDto = myPageService.findByStoreId(loggedStoreId);
		if(storeDto.getStorePwd().equals(password)) {
			model.addAttribute("storeDto", storeDto);
			return "mypage/store_info";
		}
		
		redirect.addFlashAttribute("msg", " ✖️ 비밀번호를 다시 확인해주세요.");
		return "redirect:/store/mypage/check_pwd";
	}
	
	@PostMapping("/store/mypage/update_action")
	public String update_action(@RequestParam("name") String name,
			@RequestParam("username") String id, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("address1") String add1,
			@RequestParam("address2") String add2, @RequestParam("address3") String add3,
			@RequestParam("category") int cate, Model model) {
		
		StoreDto storeDto = myPageService.findByStoreId(id);

		storeDto.setStoreName(name);
		storeDto.setStoreTel(phone);
		storeDto.setStoreEmail(email);
		storeDto.setStoreAdd1(add1);
		storeDto.setStoreAdd2(add2);
		storeDto.setStoreAdd3(add3);
		storeDto.setCategoryNo(cate);
		
		myPageService.save(storeDto);
		model.addAttribute("title", "마이페이지");
		model.addAttribute("subTitle", "COMPLETE");
		model.addAttribute("msg", "가맹점 정보가 수정되었습니다. 메인페이지로 이동하여 서비스를 이용하세요.");
		return "store_complete";
	}
	
	// 회원
	@GetMapping("/member/mypage/check_pwd")
	public String member_check_pwd(HttpSession session) {
		if(session.getAttribute("loggedMemberId") == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		return "mypage/member_check_pwd";
	}
	
	@PostMapping("/member/mypage/check_action")
	public String member_check_action(@RequestParam String password,
			Model model, RedirectAttributes redirect, HttpSession session) {
		String loggedMemberId = (String)session.getAttribute("loggedMemberId");
		CustomerDto customerDto = myPageService.findByCustomerId(loggedMemberId);
		if(customerDto.getCustomerPwd().equals(password)) {
			model.addAttribute("customerDto", customerDto);
			return "mypage/member_info";
		}
		
		redirect.addFlashAttribute("msg", " ✖️ 비밀번호를 다시 확인해주세요.");
		return "redirect:/member/mypage/check_pwd";
	}
	
	@PostMapping("/member/mypage/update_action")
	public String member_update_action(@RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("username") String id,
			@RequestParam("gender") String gender, @RequestParam("birth") String birth,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address1") String add1, @RequestParam("address2") String add2,
			@RequestParam("address3") String add3, Model model) {
		
		CustomerDto customerDto = myPageService.findByCustomerId(id);

		customerDto.setCustomerEmail(email);
		customerDto.setCustomerGender(gender);
		customerDto.setCustomerBirth(birth);
		customerDto.setCustomerName(name);
		customerDto.setCustomerTel(phone);
		customerDto.setCustomerAdd1(add1);
		customerDto.setCustomerAdd2(add2);
		customerDto.setCustomerAdd3(add3);
		customerDto.setCustomerNickname(nickname);
		
		myPageService.MemberSave(customerDto);
		model.addAttribute("title", "마이페이지");
		model.addAttribute("subTitle", "COMPLETE");
		model.addAttribute("msg", "회원정보가 수정되었습니다. 메인페이지로 이동하여 서비스를 이용하세요.");
		return "member_complete";
	}
	
	@GetMapping("/member/mypage/use_list")
	public String member_use_list(HttpSession session, Model model) {
		String loggedMemberId = (String)session.getAttribute("loggedMemberId");
		if(loggedMemberId == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		List<Object[]> list = myPageService.findByCustomerIdToList(loggedMemberId);
		model.addAttribute("list", list);
	    
		if(list.size() == 0) {
			model.addAttribute("msg", "보유한 기프티콘이 없습니다.");
		}
		
		return "mypage/member_use_list";
	}
	
	@GetMapping("/member/mypage/use_detail")
	public String member_use_detail(HttpSession session, Model model, @RequestParam("giftNo") long giftNo) {
		String loggedMemberId = (String) session.getAttribute("loggedMemberId");
		if (loggedMemberId == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		Object object = myPageService.findByGiftNo(giftNo);
		
		Gson gson = new Gson();
		String jsonObject = gson.toJson(object);
		
		model.addAttribute("object", object);
		model.addAttribute("jsonObject", jsonObject);
		return "mypage/member_use_detail";
	}
	
	@GetMapping("/member/mypage/check_point")
	public String member_check_point(HttpSession session, Model model) {
		String loggedMemberId = (String) session.getAttribute("loggedMemberId");
		if (loggedMemberId == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		CustomerDto customerDto = myPageService.findByCustomerId(loggedMemberId);
		int point = customerDto.getPoint();
		model.addAttribute("point", point);
		
		return "mypage/member_check_point";
	}
	
	@GetMapping("/member/mypage/jjim_list")
	public String member_jjim_list(HttpSession session, Model model) {
		String loggedMemberId = (String)session.getAttribute("loggedMemberId");
		if(loggedMemberId == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		List<Object[]> list = myPageService.findByCustomerIdToJjimList(loggedMemberId);
		model.addAttribute("list", list);
		
		if(list.size() == 0) {
			model.addAttribute("msg", "보유한 기프티콘이 없습니다.");
		}
		
		return "mypage/member_jjim_list";
	}
	
	@PostMapping("/member/mypage/update_jjim")
	@ResponseBody
	public ResponseEntity<String> member_update_jjim(
			@RequestParam("jjimNo") int jjimNo, @RequestParam("jjimStatus") boolean jjimStatus,
			@RequestParam("productNo") int productNo, HttpSession session) {
		String customerId = (String)session.getAttribute("loggedMemberId");
		
		JjimDto jjimDto = new JjimDto();
		jjimDto.setCustomerId(customerId);
		jjimDto.setProductNo(productNo);
		jjimDto.setJjimNo(jjimNo);
		
		if(jjimStatus) {
			jjimDto.setJjimStatus(1);
		} else {
			jjimDto.setJjimStatus(2);
		}
		
		myPageService.save(jjimDto);
		
		return ResponseEntity.ok("완료");
	}
}
