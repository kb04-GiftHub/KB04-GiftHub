package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.service.CustomerService;
import mulcam.kb04.gifthub.GiftHub.service.DonationService;

@Controller
public class DonationController {

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	CustomerService customerService;

	@Autowired
	DonationService donationService;

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

	@GetMapping("/donation/donateboard")
	public String donateboard() {
		return "donation/donateboard";
	}

	@GetMapping("/donation/donation")
	public String donation() {
		return "donation/donation";
	}

	@GetMapping("/donation/donation_list")
	public String donationList(HttpSession session, Model model) {
		String customerId = (String) session.getAttribute("loggedMemberId");
		Customer customer = customerService.getCustomerById(customerId);
		List<Donation> donationList = donationService.getDonationByCustomerId(customer);
		model.addAttribute("donations", donationList);
		return "/donation/donation_list";
	}
}
