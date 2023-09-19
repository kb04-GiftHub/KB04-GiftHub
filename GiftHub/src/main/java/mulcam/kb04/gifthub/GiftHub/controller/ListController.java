package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.BuyService;
import mulcam.kb04.gifthub.GiftHub.service.ExchangeService;

@RestController
public class ListController {
	@Autowired
	private ExchangeService exchangeService;

	@Autowired
	private StoreRepository storeRepository;

	@Autowired
	private BuyService buyService;

	@GetMapping("/getMonthlyCount")
	public ResponseEntity<Map<Integer, Long>> getMonthlyCount(HttpSession session) {
		String storeId = (String) session.getAttribute("loggedStoreId");
		Store store = storeRepository.findByStoreId(storeId);
		Map<Integer, Long> counts = buyService.getCountByMonth(store);
		return ResponseEntity.ok(counts);
	}

	@GetMapping("/getMonthlyExchange")
	public ResponseEntity<Map<Integer, Long>> getMonthlyExchange(HttpSession session) {
		String storeId = (String) session.getAttribute("loggedStoreId");
		Store store = storeRepository.findByStoreId(storeId);
		Map<Integer, Long> counts = exchangeService.getCountByMonth(store);
		return ResponseEntity.ok(counts);
	}

}
