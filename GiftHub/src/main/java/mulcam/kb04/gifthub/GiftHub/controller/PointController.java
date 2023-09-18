package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.PointService;

@Controller
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	// 회원 - 포인트 충전
	@GetMapping("/member/point_charge")
	public String pointCharge(HttpSession session, Model model,
	        @RequestParam(name = "page", defaultValue = "1") int pageNo,
	        @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
	    String id = (String) session.getAttribute("loggedMemberId");

	    if (id == null || session.getAttribute("loggedStroeId") != null) {
	        return "redirect:/index";
	    }

	    CustomerDto customerDto = pointService.findByCustomerId(id);
	    model.addAttribute("dto", customerDto);

	    session.setAttribute("user", customerDto);

	    // 페이징 처리
	    PageRequest pageRequest = PageRequest.of(pageNo - 1, pageSize);
	    Page<PointChargeDto> chargePage = pointService.findByCustomerIdTPage(id, pageRequest);

	    // 누적된 순번 계산
	    long totalElements = chargePage.getTotalElements();
	    long cumulativeIndex = totalElements - (pageSize * (pageNo - 1));
	    
	    model.addAttribute("chargePage", chargePage); // 페이징된 데이터
	    model.addAttribute("chargeList", chargePage.getContent()); // 실제 데이터 리스트
	    model.addAttribute("pageNo", pageNo); // 현재 페이지 번호
	    model.addAttribute("pageSize", pageSize); // 페이지 크기
	    model.addAttribute("totalChargeCount", totalElements); // 전체 데이터 개수
	    model.addAttribute("cumulativeIndex", cumulativeIndex); // 누적된 순번

	    return "point/point_charge";
	}
	
	@PostMapping("/member/point_charge_action")
	@ResponseBody
	public ResponseEntity<String> member_point_charge_action(@RequestParam("impUid") String impUid,
			@RequestParam("merchantUid") String merchantUid, @RequestParam("chargeAmount") int chargeAmount,
			HttpSession session, Model model) {
		
		PointChargeDto pointChargeDto = new PointChargeDto();

		pointChargeDto.setImpUid(impUid);
		pointChargeDto.setMerchantUid(merchantUid);
		pointChargeDto.setChargeAmount(chargeAmount);
		
		Calendar calendar = Calendar.getInstance();
	    Date currentDate = calendar.getTime();
		pointChargeDto.setChargeDate(currentDate);
		
		String id = (String)session.getAttribute("loggedMemberId");
		pointChargeDto.setCustomerId(id);
		
		pointService.save(pointChargeDto);

		CustomerDto customerDto = pointService.findByCustomerId(id);
		int point = customerDto.getPoint() + chargeAmount;
		customerDto.setPoint(point);
		
		pointService.pointSave(customerDto);
		
		return ResponseEntity.ok("완료");
	}
	
	// 가맹점 - 포인트 환전
	@GetMapping("/store/point_exchange")
	public String point_exchange(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loggedStoreId");
		
		if(id == null || session.getAttribute("loggedMemberId") != null) {
			return "redirect:/index";
		}
		
		StoreDto storeDto = pointService.findByStoreId(id);
		model.addAttribute("dto", storeDto);
		
		session.setAttribute("storeUser", storeDto);
		
		return "point/point_exchange";
	}
	
	@PostMapping("/store/point_exchange_action")
	@ResponseBody
	public ResponseEntity<String> store_point_exchange_action(@RequestParam("exchangeBank") String exchangeBank,
			@RequestParam("exchangeAccount") String exchangeAccount, @RequestParam("exchangeMoney") int exchangeMoney,
			HttpSession session, Model model) {
		
		ExchangeDto exchangeDto = new ExchangeDto();

		exchangeDto.setExchangeBank(exchangeBank);
		exchangeDto.setExchangeAccount(exchangeAccount);
		exchangeDto.setExchangeMoney(exchangeMoney);
		
		Calendar calendar = Calendar.getInstance();
	    Date currentDate = calendar.getTime();
	    exchangeDto.setExchangeDate(currentDate);
		
		String id = (String)session.getAttribute("loggedStoreId");
		exchangeDto.setStoreId(id);
		
		pointService.save(exchangeDto);

		StoreDto storeDto = pointService.findByStoreId(id);
		int point = storeDto.getStorePoint() - exchangeMoney;
		storeDto.setStorePoint(point);
		
		pointService.storePointSave(storeDto);
		
		return ResponseEntity.ok("완료");
	}
}
