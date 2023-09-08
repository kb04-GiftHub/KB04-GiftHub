package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;

	@GetMapping("/mypage/check_pwd")
	public String check_pwd() {
		return "mypage/check_pwd";
	}
	
	@PostMapping("/mypage/check_action")
	public String check_action(@RequestParam String pwd, @RequestParam String pwd_chk,
			Model model, RedirectAttributes redirect) {
		StoreDto storeDto = myPageService.findByStoreId("store1234");
		if(pwd.equals(pwd_chk)) {
			if(storeDto.getStorePwd().equals(pwd)) {
				model.addAttribute("msg", "본인인증 성공");
				return "mypage/update_info";
			}
		}
		
		redirect.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
		return "redirect:/mypage/check_pwd";
	}
	
}
