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
import mulcam.kb04.gifthub.GiftHub.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	// 가맹점 로그인
	@GetMapping("/store/login")
	public String store_login(HttpSession session) {
		if(session.getAttribute("loggedStoreId") != null || session.getAttribute("loggedMemberId") != null) {
			return "redirect:/index";
		}
		return "login/store_login";
	}
	
	@PostMapping("/store/login_action")
	public String store_login_action(@RequestParam("username") String id, @RequestParam("password") String pwd,
			Model model,RedirectAttributes redirect, HttpSession session) {
		
		if (isStoreUsernameAvailable(id)) {
			StoreDto storeDto = loginService.findByStoreId(id);
			
			if(storeDto.getStorePwd().equals(pwd)) {
				session.setAttribute("storeUser", storeDto);
				session.setAttribute("loggedStoreId", storeDto.getStoreId());
				model.addAttribute("title", "로그인");
				model.addAttribute("subTitle", "WELCOME");
				model.addAttribute("msg", storeDto.getStoreName() + "님 환영합니다. 메인페이지로 이동하여 서비스를 이용하세요.");
				return "complete/store_login_complete";
			} else {
				redirect.addFlashAttribute("msg", " ✖️ 비밀번호가 일치하지 않습니다.");
	    		return "redirect:/store/login";
			}
        } else {
        	redirect.addFlashAttribute("msg", " ✖️ 존재하지 않는 아이디입니다.");
    		return "redirect:/store/login";
        }
	}
	
	private boolean isStoreUsernameAvailable(String id) {
		
		int cnt = loginService.countByStoreId(id);
		if(cnt == 0) {
			return false;
		}
		
		return true;
	}
	
	// 회원 로그인
	@GetMapping("/member/login")
	public String member_login(HttpSession session) {
		if(session.getAttribute("loggedMemberId") != null || session.getAttribute("loggedStoreId") != null) {
			return "redirect:/index";
		}
		return "login/member_login";
	}
	
	@PostMapping("/member/login_action")
	public String member_login_action(@RequestParam("username") String id, @RequestParam("password") String pwd,
			Model model,RedirectAttributes redirect, HttpSession session) {
		
		if (isMemberUsernameAvailable(id)) {
			CustomerDto customerDto = loginService.findByCustomerId(id);
			
			if(customerDto.getCustomerPwd().equals(pwd)) {
				session.setAttribute("user", customerDto);
				session.setAttribute("loggedMemberId", customerDto.getCustomerId());
				model.addAttribute("title", "로그인");
				model.addAttribute("subTitle", "WELCOME");
				model.addAttribute("msg", customerDto.getCustomerNickname() + "님 환영합니다. 메인페이지로 이동하여 서비스를 이용하세요.");
				
				loginService.updateStauts(id);
				
				return "complete/member_login_complete";
			} else {
				redirect.addFlashAttribute("msg", " ✖️ 비밀번호가 일치하지 않습니다.");
	    		return "redirect:/member/login";
			}
        } else {
        	redirect.addFlashAttribute("msg", " ✖️ 존재하지 않는 아이디입니다.");
    		return "redirect:/member/login";
        }
	}
	
	private boolean isMemberUsernameAvailable(String id) {
		
		int cnt = loginService.countByCustomerId(id);
		if(cnt == 0) {
			return false;
		}
		
		return true;
	}
}
