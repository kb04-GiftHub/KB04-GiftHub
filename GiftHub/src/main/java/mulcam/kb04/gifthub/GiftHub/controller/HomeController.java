package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/index")
	public String home() {
		return "index";
	}
	
	@GetMapping("/store/home")
	public String store_home() {
		
		return "store/home";
	}

	@GetMapping("/manual")
	public String manual() {
		return "manual";
	}

	@GetMapping("/donate")
	public String donate() {
		return "donate";
	}
	@GetMapping("/donateboard")
	public String donateboard() {
		return "donateboard";
	}
	@GetMapping("/donation")
	public String donation() {
		return "donation";
	}


	@GetMapping("/team")
	public String team() {
		return "team";
	}
	
	@GetMapping("/service")
	public String service() {
		return "service";
	}
}

