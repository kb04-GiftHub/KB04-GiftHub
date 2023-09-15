package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;

@Controller
public class DonationController {

	@Autowired
	CustomerRepository customerRepository;

	@GetMapping("donation/donate")
	public String donate(HttpSession session, Model model) {
		if (session.getAttribute("loggedMemberId") == null && session.getAttribute("loggedStoreId") == null) {
			return "redirect:/index";
		} else if (session.getAttribute("loggedStoreId") != null && session.getAttribute("loggedMemberId") == null) {
			String loggedStoreId = (String) session.getAttribute("loggedStoreId");
			return "redirect:/sale?storeId=" + loggedStoreId;
		} else if (session.getAttribute("loggedStoreId") == null && session.getAttribute("loggedMemberId") != null) {
			Customer customer = new Customer();
			customer = customerRepository.findByCustomerId((String) session.getAttribute("loggedMemberId"));
			int point = customer.getPoint();
			model.addAttribute("point", point);
			return "donation/donate";
		}
		return "donation/donate";
	}

	@PostMapping("/donate_done")
	public String donateDone() {
		return "donation/donate_done";
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
