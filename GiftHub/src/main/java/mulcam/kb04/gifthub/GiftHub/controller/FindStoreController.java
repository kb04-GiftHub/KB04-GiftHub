package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@Controller
public class FindStoreController {

	@Autowired
	private FindStoreService findStoreService;

	@GetMapping("/showMap")
	public String showMap(Model model, @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		List<Store> stores = findStoreService.getAllStores();
		Gson gson = new Gson();
		String jsonStores = gson.toJson(stores);

		int totalDataCount = stores.size();
		int dataPerPage = 10;
		int totalPages = (int) Math.ceil((double) totalDataCount / dataPerPage);
		int pagesPerGroup = 5;
		int currentGroup = (int) Math.ceil((double) currentPage / pagesPerGroup);

		// 현재 페이지에 따라서 데이터를 분할
		int start = (currentPage - 1) * dataPerPage;
		int end = Math.min(start + dataPerPage, totalDataCount);
		List<Store> pagedStores = stores.subList(start, end);

		model.addAttribute("jsonStores", jsonStores);
		model.addAttribute("stores", stores);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("pagedStores", pagedStores);
		return "store/storemap";
	}
}
