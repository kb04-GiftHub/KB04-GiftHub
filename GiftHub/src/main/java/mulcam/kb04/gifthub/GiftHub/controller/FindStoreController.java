package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@RestController
@RequestMapping("stores")
public class FindStoreController {

	@Autowired
	private FindStoreService findStoreService;

	@GetMapping("/all")
	public List<StoreDto> getAllStores() {
		return findStoreService.findAllStores();
	}
}
