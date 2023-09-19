package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;
import mulcam.kb04.gifthub.GiftHub.service.BuyService;
import mulcam.kb04.gifthub.GiftHub.service.CombinedViewService;

@Controller
public class SaleController {

	@Autowired
	private CombinedViewService combinedViewService;

	@Autowired
	private BuyService buyService;

	@GetMapping("/sale")
	public String listSale(Model model, @RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "storeId") String storeId, HttpSession session) {
//		String id = (String) session.getAttribute("loggedStoreId");
		List<Object[]> buyData = buyService.findByStoreId(storeId);
		List<CombinedView> combinedViewData = combinedViewService.findByStoreId(storeId);

		int totalDataCount = buyData.size();
		int dataPerPage = 10;
		int totalPages = (int) Math.ceil((double) totalDataCount / dataPerPage);
		int pagesPerGroup = 5;
		int currentGroup = (int) Math.ceil((double) currentPage / pagesPerGroup);

		// 현재 페이지에 따라서 데이터를 분할
		int start = (currentPage - 1) * dataPerPage;
		int end = Math.min(start + dataPerPage, totalDataCount);
		List<Object[]> pagedStores = buyData.subList(start, end);

		model.addAttribute("combinedViewData", combinedViewData);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("storeId", storeId);
		model.addAttribute("pagedStores", pagedStores);

		return "list/sale";
	}
}
