package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.repository.PromotionRepository;

public class PromotionHomController {

	//게시물 등록하기 
	@GetMapping("/promotion_insert_form")
    public String promotionInsertForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        return "promotion_insert_form";
    }
	
	//게시물 목록 
	@Autowired
    private PromotionRepository promotionRepository;

//	@GetMapping("/promotion_list")
//	public String promotionList(@RequestParam("storeId") String storeId, Model model) {
//	    List<Promotion> promotionList = promotionRepository.findByStoreId(storeId);
//	    model.addAttribute("promotion_list", promotionList);
//	    return "promotion_list";
//	}
	@GetMapping("/promotion_list")
	public String promotionList(int promotionNo, Model model) {
	    String storeId = "store1234";
	    
	    if (storeId != null) {
	        List<Promotion> promotionList = promotionRepository.findByStoreId(storeId);
	        model.addAttribute("promotion_list", promotionList);
	    }
	    
	    return "promotion_list";
	}
	
	//게시물 목록에서 이동한 상세 페이지
	@GetMapping("/promotion_detail")
	public String promotionDetail(@RequestParam("promotionNo") int promotionNo, Model model) {
	    Optional<Promotion> promotion = Optional.of(promotionRepository.findByPromotionNo(promotionNo));
	    promotion.ifPresent(value -> model.addAttribute("promotion", value));
	    return "promotion_detail";
	}
	//게시글 상세페이지에서 이동한 삭제 페이지
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";
	}
	//게시글 상세페이지에서 이동한 수정 페이지
	@GetMapping("/promotion_update_form")
	public String promotion_update_form() {
		return "promotion_update_form";
}
	//사용자(가맹점주X) 게시글 목록 보기
	@GetMapping("/promotionView")
	public String promotionView() {
		return "promotionView";
}
	//사용자 게시글 목록에서 이동한 사용자 게시글 상세 보기
	@GetMapping("/promotionView_detail")
	public String promotionView_detail() {
		return "promotionView_detail";
}

}
