package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.service.CustomerService;

@Controller
public class DonationController {

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	CustomerService customerService;

	@GetMapping("/donation/donate")
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

//	@PostMapping("/donation/donate_done")
//	public String updateCustomerPoint(@RequestParam int pointToUse, HttpSession session,
//			RedirectAttributes redirectAttributes) {
//		String customerId = (String) session.getAttribute("loggedMemberId");
//		customerService.updateCustomerPoint(customerId, pointToUse);
//		int point = customerService.getCustomerById(customerId).getPoint();
//		redirectAttributes.addFlashAttribute("point", point);
//		return "redirect:/donation/donate_done";
//	}

	@PostMapping("/donation/donate_done")
	public String updateCustomerPoint(@RequestParam int pointToUse, HttpSession session, Model model) {
		String customerId = (String) session.getAttribute("loggedMemberId");
		customerService.updateCustomerPoint(customerId, pointToUse);
		int point = customerService.getCustomerById(customerId).getPoint();
		session.setAttribute("point", point); // 세션에 데이터 저장
		return "redirect:/donation/donate_done";
	}

	@GetMapping("/donation/donate_done")
	public String showCompletionPage(HttpSession session, Model model) {
		String customerId = (String) session.getAttribute("loggedMemberId");
		int point = customerService.getCustomerById(customerId).getPoint();
		model.addAttribute("point", point);
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
