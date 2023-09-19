package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationOrgDto;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;
import mulcam.kb04.gifthub.GiftHub.repository.CustomerRepository;
import mulcam.kb04.gifthub.GiftHub.service.DonationService;

@Controller
public class DonationController {

	@Autowired
	CustomerRepository customerRepository;

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
			String id = (String) session.getAttribute("loggedMemberId");
			CustomerDto customerDto = donationService.findByCustomerId(id);
			model.addAttribute("point", customerDto.getPoint());
			
			return "donation/donate";
		}
		return "donation/donate";
	}

	@PostMapping("/donation/donate_done")
	public String updateCustomerPoint(@RequestParam("pointToUse") int pointToUse, @RequestParam("org") int orgNo,
			HttpSession session, Model model) {
		String customerId = (String) session.getAttribute("loggedMemberId");
		CustomerDto customerDto = donationService.updateCustomerPoint(customerId, pointToUse);
		donationService.updateOrgTotal(orgNo, pointToUse);
		
		DonationDto donationDto = new DonationDto();
		donationDto.setDonationAmount(pointToUse);
		donationDto.setCustomerId(customerId);
		donationDto.setOrgNo(orgNo);
		
		Calendar calendar = Calendar.getInstance();
	    Date currentDate = calendar.getTime();
		donationDto.setDonationDate(currentDate);
		
		donationService.updateList(donationDto);
		
		session.setAttribute("user", customerDto);
		
		return "redirect:/donation/donate_done?orgNo=" + orgNo;
	}

	@GetMapping("/donation/donate_done")
	public String showCompletionPage(HttpSession session, Model model, @RequestParam("orgNo") int orgNo) {
		String id = (String) session.getAttribute("loggedMemberId");
		CustomerDto customerDto = donationService.findByCustomerId(id);
		DonationOrgDto donationOrgDto = donationService.findByOrgNo(orgNo);
		model.addAttribute("point", customerDto.getPoint());
		model.addAttribute("orgDto", donationOrgDto);
		
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
		CustomerDto customerDto = donationService.findByCustomerId(customerId);
		List<Donation> donationList = donationService.getDonationByCustomerId(customerDto);
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
