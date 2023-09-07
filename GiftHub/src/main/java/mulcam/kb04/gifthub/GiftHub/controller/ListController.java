package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Controller
public class ListController {
	@Autowired
	private GiftUsedService giftUsedService;

	@RequestMapping(value = "/getCountByMonth", produces = "application/json")
	public Map<String, Long> getCountByMonth(@RequestParam(name = "month") int month, Model model) {
		Long count = giftUsedService.getCountByMonth(month);
		Map<String, Long> response = new HashMap<>();
		response.put("count", count);
		return response;
	}
}
