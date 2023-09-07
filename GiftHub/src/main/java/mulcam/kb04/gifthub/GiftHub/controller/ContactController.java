package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {
	
	@GetMapping("/contact/contact")
	public String contact() {
		return "contact/contact";
	}
}
