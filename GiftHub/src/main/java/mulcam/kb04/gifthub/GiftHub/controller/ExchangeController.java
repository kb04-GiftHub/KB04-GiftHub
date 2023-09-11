package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.service.ExchangeService;

@Controller
public class ExchangeController {
	@Autowired
	private ExchangeService exchangeService;

	@GetMapping("/exchange")
	public String getExchangeDetails(Model model, @RequestParam String storeId) {
		List<ExchangeDto> exchangeDetailsList = exchangeService.findExchangeDetailsByStoreId(storeId);
		model.addAttribute("exchangeDetailsList", exchangeDetailsList);
		return "list/exchange";
	}
}
