package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;
import mulcam.kb04.gifthub.GiftHub.service.PointChargeService;

@Controller
public class PointChargeController {
	
	@Autowired
	private PointChargeService chargeService;
	
	@GetMapping("/member/point_charge")
	public String check_pwd(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loggedMemberId");
		
		if(id == null || session.getAttribute("loggedStroeId") != null) {
			return "redirect:/index";
		}
		
		CustomerDto customerDto = chargeService.findByCustomerId(id);
		model.addAttribute("dto", customerDto);
		
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
		
		chargeService.save(pointChargeDto);
		System.out.println("등록");
		System.out.println(impUid);
		
		return ResponseEntity.ok("완료");
	}
}
