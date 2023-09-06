package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.repository.PromotionRepository;

@Controller
public class HomeController {

	@GetMapping("/promotion_insert_form")
    public String promotionInsertForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        return "promotion_insert_form";
    }

	@GetMapping("/promotion_list")
    public String promotionList(Model model) {
        // Promotion 데이터를 가정하여 리스트 생성
        List<Promotion> promotionList = new ArrayList<>();
        promotionList.add(new Promotion(1, "바삭바삭 소금빵","2000원 할인",2023-08-11,1,"스타벅스1"));
        promotionList.add(new Promotion(2, "달달한 초코칩"));

        model.addAttribute("promotion_list", promotionList);
        return "promotion_list";
    }

	
	  @GetMapping("/promotion_detail")
	    public String promotionDetail(@RequestParam("no") int promotionNo, Model model) {
	        // Promotion 데이터를 가정하여 Promotion 객체 생성
	        Promotion promotion = new Promotion();

	        model.addAttribute("promotion", promotion);
	        return "promotion_detail";
	    }
	
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";//게시글 목록 => 삭제 페이지로 이동
	}
	
	@GetMapping("/promotion_update_form")
	public String promotion_update_form() {
		return "promotion_update_form";//게시글 목록 => 수정 페이지로 이동
}
	@GetMapping("/promotionView")
	public String promotionView() {
		return "promotionView";//사용자 게시글 목록 보기
}
	@GetMapping("/promotionView_detail")
	public String promotionView_detail() {
		return "promotionView_detail";//사용자 게시글 상세 보기
}
}