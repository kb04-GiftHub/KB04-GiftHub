package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.service.GiftService;

@Controller
public class CalendarController {
	@Autowired
	private GiftService giftService;
	
	@GetMapping("/member/main")
	public String member_main(HttpSession ses, Model model) {
		
		String loggedMemberId = (String) ses.getAttribute("loggedMemberId");
		if(loggedMemberId == null || ses.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		CustomerDto customerDto =  giftService.findByCustomerId(loggedMemberId);
		List<GiftDto> list = giftService.findByCustomerIdToList(loggedMemberId);
		
		model.addAttribute("list", list);
		System.out.println(list);

		return "member/main";
	}
	
}
