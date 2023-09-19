package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
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
	public String donationList(HttpSession session, Model model,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		String customerId = (String) session.getAttribute("loggedMemberId");
		Customer customer = customerService.getCustomerById(customerId);
		List<Donation> donationList = donationService.getDonationByCustomerId(customer);
		int totalDataCount = donationList.size();
		int dataPerPage = 10;
		int totalPages = (int) Math.ceil((double) totalDataCount / dataPerPage);
		int pagesPerGroup = 5;
		int currentGroup = (int) Math.ceil((double) currentPage / pagesPerGroup);

		// 현재 페이지에 따라서 데이터를 분할
		int start = (currentPage - 1) * dataPerPage;
		int end = Math.min(start + dataPerPage, totalDataCount);
		List<Donation> pagedStores = donationList.subList(start, end);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("donations", donationList);
		model.addAttribute("pagedStores", pagedStores);
		return "/donation/donation_list";
	}
}
