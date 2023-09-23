package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(HttpSession session) {
		if (session.getAttribute("loggedMemberId") == null && session.getAttribute("loggedStoreId") == null) {
			return "index";
		} else if (session.getAttribute("loggedMemberId") == null) {
			return "list/sale";
		} else {
			return "member/main";
		}
	}

	@GetMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("loggedMemberId") == null && session.getAttribute("loggedStoreId") == null) {
			return "index";
		} else if (session.getAttribute("loggedMemberId") == null) {
			return "list/sale";
		} else {
			return "member/main";
		}
	}

	@GetMapping("/store/home")
	public String store_home() {

		return "store/home";
	}

	@GetMapping("/manual")
	public String manual() {
		return "manual";
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
