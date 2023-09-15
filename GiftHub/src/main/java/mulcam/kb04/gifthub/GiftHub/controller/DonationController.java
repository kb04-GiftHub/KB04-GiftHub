package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DonationController {
	@GetMapping("donation/donate")
	public String donate(HttpSession session) {
		if (session.getAttribute("loggedMemberId") == null && session.getAttribute("loggedStoreId") == null) {
			return "redirect:/index";
		} else if (session.getAttribute("loggedStoreId") != null && session.getAttribute("loggedMemberId") == null) {
			String loggedStoreId = (String) session.getAttribute("loggedStoreId");
			return "redirect:/sale?storeId=" + loggedStoreId;
		} else if (session.getAttribute("loggedStoreId") == null && session.getAttribute("loggedMemberId") != null) {
			return "donation/donate";
		}
		return "donation/donate";
	}

	@GetMapping("donation/donateboard")
	public String donateboard() {
		return "donation/donateboard";
	}

	@GetMapping("donation/donation")
	public String donation() {
		return "donation/donation";
	}
}
