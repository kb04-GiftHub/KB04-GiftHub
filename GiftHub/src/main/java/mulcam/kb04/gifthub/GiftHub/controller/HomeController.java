package mulcam.kb04.gifthub.GiftHub.controller;

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
	
	//게시물 등록하기 
	@GetMapping("/promotion_insert_form")
    public String promotionInsertForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        return "promotion_insert_form";
    }

	@Autowired
    private PromotionRepository promotionRepository;

    @GetMapping("/promotion_list")
    public String promotionList(Model model) {
        // Promotion 테이블에서 데이터를 가져와서 promotionList 생성
        List<Promotion> promotionList = promotionRepository.findAll();
       model.addAttribute("promotion_list", promotionList);
        return "promotion_list";
    }
	
	  @GetMapping("/promotion_detail")
	    public String promotionDetail(@RequestParam("PromotionNo") int PromotionNo, Model model) {
	        // Promotion 데이터를 가정하여 Promotion 객체 생성
	        Promotion promotion = new Promotion();

	        model.addAttribute("promotion", promotion);
	        return "promotion_detail";
	    }
	
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";//게시글 목록에서 이동한 삭제 페이지
	}
	
	@GetMapping("/promotion_update_form")
	public String promotion_update_form() {
		return "promotion_update_form";//게시글 목록에서 이동한 수정 페이지
}
	@GetMapping("/promotionView")
	public String promotionView() {
		return "promotionView";//사용자 게시글 목록 보기
}
	@GetMapping("/promotionView_detail")
	public String promotionView_detail() {
		return "promotionView_detail";//사용자 게시글 목록에서 이동한 사용자 게시글 상세 보기
}
}