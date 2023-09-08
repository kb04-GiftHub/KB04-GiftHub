package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreHomeController {
	@GetMapping("/calculate")
	public String calculate() {
		return "list/calculate";
	}
}
