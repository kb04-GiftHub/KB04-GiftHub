package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@Controller
public class FindStoreController {

	@Autowired
	private FindStoreService findStoreService;
	
	@GetMapping("/stores")
	public String getStores(Model model) {
		List<Store> stores = findStoreService.findAllStores();
		model.addAttribute("stores", stores);
		return "store/storemap";
	}
}
