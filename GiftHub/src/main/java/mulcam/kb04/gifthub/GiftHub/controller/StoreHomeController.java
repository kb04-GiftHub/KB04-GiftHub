package mulcam.kb04.gifthub.GiftHub.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Controller
public class StoreHomeController {
    @Autowired
    private GiftUsedService giftUsedService;

    @GetMapping("/sale")
    public String showChart(@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
                            Model model) {
        long count = giftUsedService.getCountBetweenDates(startDate, endDate);
        model.addAttribute("count", count);
        model.addAttribute("startDate", new SimpleDateFormat("yyyy-MM-dd").format(startDate));
        model.addAttribute("endDate", new SimpleDateFormat("yyyy-MM-dd").format(endDate));
        return "list/sale";
    }
	
	@GetMapping("/calculate")
	public String calculate() {
		return "list/calculate";
	}
}
