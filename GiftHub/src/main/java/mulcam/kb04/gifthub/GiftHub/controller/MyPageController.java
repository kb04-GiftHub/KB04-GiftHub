package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;

	// 가맹점
	@GetMapping("/store/mypage/check_pwd")
	public String check_pwd(HttpSession session) {
		if(session.getAttribute("loggedId") == null) {
			return "redirect:/index";
		}
		
		return "mypage/store_check_pwd";
	}
	
	@PostMapping("/store/mypage/check_action")
	public String check_action(@RequestParam String password,
			Model model, RedirectAttributes redirect, HttpSession session) {
		String loggedId = (String)session.getAttribute("loggedId");
		StoreDto storeDto = myPageService.findByStoreId(loggedId);
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
		return "complete";
	}
	
	// 회원
	@GetMapping("/member/mypage/check_pwd")
	public String member_check_pwd(HttpSession session) {
		if(session.getAttribute("loggedId") == null) {
			return "redirect:/index";
		}
		
		return "mypage/member_check_pwd";
	}
	
	@PostMapping("/member/mypage/check_action")
	public String member_check_action(@RequestParam String password,
			Model model, RedirectAttributes redirect, HttpSession session) {
		String loggedId = (String)session.getAttribute("loggedId");
		CustomerDto customerDto = myPageService.findByCustomerId(loggedId);
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
		return "complete";
	}
}
