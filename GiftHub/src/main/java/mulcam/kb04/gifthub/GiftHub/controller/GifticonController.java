package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GifticonController {
	
	
	@GetMapping("/about")
	public String gifticon_add() {
		//model.addAttribute("msg", msg);
		
		//return "project";
		return "gifticon/add_form";
	}
	
	@PostMapping("/gifticon/insert_action")
	public String insert_cation() {
		
		return "about";
		
	}
	
	
}
