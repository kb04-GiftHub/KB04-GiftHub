package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;
import mulcam.kb04.gifthub.GiftHub.service.CombinedViewService;

@Controller
public class SaleController {

	@Autowired
	private CombinedViewService combinedViewService;

	@GetMapping("/sale")
	public String listSale(Model model, @RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "storeId") String storeId) {
		List<CombinedView> combinedViewData = combinedViewService.findByStoreId(storeId);
		model.addAttribute("combinedViewData", combinedViewData);

		int totalDataCount = combinedViewData.size(); // 데이터 리스트의 크기를 사용하여 전체 데이터 개수를 계산합니다.
		int dataPerPage = 10; // 한 페이지에 표시할 데이터 개수를 설정합니다.
		int totalPages = (int) Math.ceil((double) totalDataCount / dataPerPage);
		int pagesPerGroup = 5; // 한 그룹에 표시할 페이지 수를 설정합니다.
		int currentGroup = (int) Math.ceil((double) currentPage / pagesPerGroup);

		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("storeId", storeId); // storeId 파라미터를 모델에 추가합니다.

		return "list/sale"; // sale.jsp 페이지로 이동합니다.
	}
}
