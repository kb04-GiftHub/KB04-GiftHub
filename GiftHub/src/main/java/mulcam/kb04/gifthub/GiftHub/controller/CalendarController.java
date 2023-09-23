package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
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
		System.out.println(customerDto);
		List<Object[]> list = giftService.findByCustomerIdToList(loggedMemberId);
		
		model.addAttribute("list", list);
		
		for (Object[] objects : list) {
			System.out.println(objects[1]);
			System.out.println("리스트>> 1" + objects[1]);
			System.out.println("리스트>> 2" + objects[2]);
			System.out.println("리스트>> 0" + objects[0]);
			System.out.println("리스트>> 3" + objects[3]);
			System.out.println("리스트>> 4" + objects[4]);
			System.out.println("리스트>> 5" + objects[5]);
			System.out.println("리스트>> 6" + objects[6]);
			System.out.println("리스트>> 7" + objects[7]);
			System.out.println("리스트>> 8" + objects[8]);
			System.out.println("리스트>> 9" + objects[9]);
			System.out.println("리스트>> 10" + objects[10]);
			System.out.println("리스트>> 11" + objects[11]);
		}
		System.out.println("리스트>> " + list);

		return "member/main";
	}
	
}
