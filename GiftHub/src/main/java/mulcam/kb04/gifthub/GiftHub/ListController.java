package mulcam.kb04.gifthub.GiftHub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Controller
public class ListController {
	@Autowired
	private GiftUsedService giftUsedService;

	@GetMapping("/getCountByMonth")
	public String getCountByMonth(@RequestParam int month, Model model) {
		Long count = giftUsedService.getCountByMonth(month);
		model.addAttribute("count", count);
		model.addAttribute("selectedMonth", month);
		return "list/sale"; // 여기에 JSP 파일 이름을 입력하세요 (확장자 없이)
	}
}
