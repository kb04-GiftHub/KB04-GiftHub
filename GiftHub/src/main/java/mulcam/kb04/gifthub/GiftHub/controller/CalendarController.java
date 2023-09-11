package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {
	
	@GetMapping("/member/main")
	public String member_main() {
		
		return "member/main";
	}
	
}
