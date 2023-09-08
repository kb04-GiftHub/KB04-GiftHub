package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;
import mulcam.kb04.gifthub.GiftHub.service.CombinedViewService;

@Controller
public class SaleController {
	
	@Autowired
	private CombinedViewService combinedViewService;
	
	@GetMapping("/sale")
	public String getCombinedView(@RequestParam String storeId, Model model) {
		List<CombinedView> combinedViewData = combinedViewService.findByStoreId(storeId);
		model.addAttribute("combinedViewData", combinedViewData);
		return "list/sale"; // Thymeleaf 템플릿 파일 이름
	}
}
