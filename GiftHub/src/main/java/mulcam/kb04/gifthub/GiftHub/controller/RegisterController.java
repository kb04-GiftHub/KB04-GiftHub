package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.RegisterService;

@Controller
public class RegisterController {
	
	@Autowired
	RegisterService registerService;
	
	// 가맹점 회원가입
	@GetMapping("/store/register")
	public String store_register(HttpSession session) {
		if(session.getAttribute("loggedStoreId") != null || session.getAttribute("loggedMemberId") != null) {
			return "redirect:/index";
		}
		
		return "login/store_register";
	}
	
	@PostMapping("/store/register_action")
	public String store_register_action(@RequestParam("name") String name,
			@RequestParam("username") String id, @RequestParam("password") String pwd,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address1") String add1, @RequestParam("address2") String add2,
			@RequestParam("address3") String add3, @RequestParam("category") int cate,
			@RequestParam("status") int status, Model model) {
		
		StoreDto storeDto = new StoreDto();

		storeDto.setStoreId(id);
		storeDto.setStorePwd(pwd);
		storeDto.setStoreName(name);
		storeDto.setStoreTel(phone);
		storeDto.setStoreEmail(email);
		storeDto.setStoreAdd1(add1);
		storeDto.setStoreAdd2(add2);
		storeDto.setStoreAdd3(add3);
		storeDto.setCategoryNo(cate);
		storeDto.setStoreStatus(status);
		storeDto.setStorePoint(0);
		
		registerService.save(storeDto);
		model.addAttribute("title", "회원가입");
		model.addAttribute("subTitle", "WELCOME");
		model.addAttribute("msg", "가맹점 등록이 완료되었습니다. 로그인 후 서비스를 이용하세요.");
		return "complete/store_register_complete";
	}
	
	@PostMapping("/store/id_check_action")
	@ResponseBody
	public String storeId_check_action(@RequestParam("username") String id) {
		
		if (isStoreUsernameAvailable(id)) {
            return "available";
        }
		
		return "unavailable";
		
	}

	private boolean isStoreUsernameAvailable(String id) {
		
		int cnt = registerService.countByStoreId(id);
		if(cnt == 0) {
			return true;
		}
		
		return false;
	}
	
	// 회원 회원가입
	@GetMapping("/member/register")
	public String member_register(HttpSession session) {
		if(session.getAttribute("loggedMemberId") != null || session.getAttribute("loggedStoreId") != null) {
			return "redirect:/index";
		}
		
		return "login/member_register";
	}
	
	@PostMapping("/member/register_action")
	public String member_register_action(@RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("username") String id,
			@RequestParam("password") String pwd, @RequestParam("gender") String gender, 
			@RequestParam("birth") String birth,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address1") String add1, @RequestParam("address2") String add2,
			@RequestParam("address3") String add3, @RequestParam("status") int status, 
			Model model) {
		
		CustomerDto customerDto = new CustomerDto();

		customerDto.setCustomerId(id);
		customerDto.setCustomerPwd(pwd);
		customerDto.setCustomerEmail(email);
		customerDto.setCustomerGender(gender);
		customerDto.setCustomerBirth(birth);
		customerDto.setCustomerName(name);
		customerDto.setCustomerTel(phone);
		customerDto.setCustomerAdd1(add1);
		customerDto.setCustomerAdd2(add2);
		customerDto.setCustomerAdd3(add3);
		customerDto.setPoint(0);
		customerDto.setCustomerNickname(nickname);
		customerDto.setCustomerStatus(status);
		
		registerService.memberSave(customerDto);
		
		model.addAttribute("title", "회원가입");
		model.addAttribute("subTitle", "WELCOME");
		model.addAttribute("msg", "회원등록이 완료되었습니다. 로그인 후 서비스를 이용하세요.");
		return "complete/member_register_complete";
	}
	
	@PostMapping("/member/id_check_action")
	@ResponseBody
	public String memberId_check_action(@RequestParam("username") String id) {
		if (isMemberUsernameAvailable(id)) {
            return "available";
        }
		
		return "unavailable";
		
	}

	private boolean isMemberUsernameAvailable(String id) {
		
		int cnt = registerService.memberCountByStoreId(id);
		if(cnt == 0) {
			return true;
		}
		
		return false;
	}
	
}
