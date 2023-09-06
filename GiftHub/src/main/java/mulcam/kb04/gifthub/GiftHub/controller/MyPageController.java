package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyPageController {

	@GetMapping("/mypage/check_pwd")
	public String check_pwd() {
		return "mypage/check_pwd";
	}
	
	@PostMapping("/mypage/check_action")
	public String check_action() {
		return "mypage/update_info";
	}
	
}
