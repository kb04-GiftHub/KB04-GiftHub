package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@GetMapping("/index")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/")
    public String checkSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String previousUrl = request.getHeader("previousUrl");

        String loggedMemberId = (String) session.getAttribute("loggedMemberId");
        String loggedStoreId = (String) session.getAttribute("loggedStoreId");
        System.out.println(previousUrl);
        if (loggedMemberId != null || loggedStoreId != null) {
        	
            return "redirect:" + previousUrl;
        }

        // 로그인이 필요한 경우 또는 다른 조건에 따라 다른 페이지로 리다이렉트
        return "redirect:/loginPage";
    }
	
	@RequestMapping("/index")
    public String checkSession1(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String referrer = request.getHeader("Referer");

        String loggedMemberId = (String) session.getAttribute("loggedMemberId");
        String loggedStoreId = (String) session.getAttribute("loggedStoreId");

        if (loggedMemberId != null || loggedStoreId != null) {
            return "redirect:" + referrer;
        }

        // 로그인이 필요한 경우 또는 다른 조건에 따라 다른 페이지로 리다이렉트
        return "redirect:/loginPage";
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
