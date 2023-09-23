package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LogoutController {

	@GetMapping("/logout")
	public String login(HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("loggedStoreId") != null) {
			session.removeAttribute("loggedStoreId");
			session.removeAttribute("user");
			redirect.addFlashAttribute("msg", "로그아웃이 완료되었습니다.");
			return "redirect:/index";
		}
		
		if(session.getAttribute("loggedMemberId") != null) {
			session.removeAttribute("loggedMemberId");
			session.removeAttribute("user");
			redirect.addFlashAttribute("msg", "로그아웃이 완료되었습니다.");
			return "redirect:/index";
		}
		
		return "logout404";
	}

}
