package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/index")
	public String index() {
		return "index";
	}

	@GetMapping("/home")
	public String home() {
		return "home";
	}

	@GetMapping("/store/home")
	public String store_home() {

		return "store/home";
	}

	@GetMapping("/manual")
	public String manual() {
		return "manual";
	}

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}

	@GetMapping("/register")
	public String register() {
		return "login/register";
	}

}
