package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GifticonController {
	
	
	@GetMapping("/about")
	public String gifticon_add() {
		//model.addAttribute("msg", msg);
		
		//return "project";
		return "gifticon/add_form";
	}
}
