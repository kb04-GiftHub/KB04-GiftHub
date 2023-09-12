package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@Controller
public class FindStoreController {

	@Autowired
	private FindStoreService findStoreService;

	@GetMapping("/showMap")
	public String showMap(Model model) {
	    List<Store> stores = findStoreService.getAllStores();
	    Gson gson = new Gson();
	    String jsonStores = gson.toJson(stores);
	    model.addAttribute("stores", jsonStores);
	    return "store/storemap";
	}
}
