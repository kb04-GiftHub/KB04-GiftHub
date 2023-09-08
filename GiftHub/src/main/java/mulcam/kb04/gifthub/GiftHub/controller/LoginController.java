package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@PostMapping("/login_action")
	public String register_action(@RequestParam("username") String id, @RequestParam("password") String pwd,
			Model model,RedirectAttributes redirect, HttpSession session) {
		
		if (isUsernameAvailable(id)) {
			StoreDto storeDto = loginService.findByStoreId(id);
			
			if(storeDto.getStorePwd().equals(pwd)) {
				session.setAttribute("loggedId", storeDto);
				return "login/login_complete";
			} else {
				redirect.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
	    		return "redirect:/login";
			}
        } else {
        	redirect.addFlashAttribute("msg", "존재하지 않는 아이디입니다.");
    		return "redirect:/login";
        }
	}
	
	private boolean isUsernameAvailable(String id) {
		
		int cnt = loginService.countByStoreId(id);
		if(cnt == 0) {
			return false;
		}
		
		return true;
	}
	
}
