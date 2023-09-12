package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
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
		model.addAttribute("stores", jsonStores);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		return "store/storemap";
	}
}
