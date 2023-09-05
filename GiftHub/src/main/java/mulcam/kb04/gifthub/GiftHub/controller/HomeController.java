package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
//	@Autowired
//	private PromotionMapper promotionMapper;
	
	@GetMapping("/promotion_insert_form")
	public String promotion_insert_form() {
		return "promotion_insert_form";//게시글 등록
	}
//	
//	@GetMapping("/promotion_detail")
//	public String promotion_detail(
//			@RequestParam("promotionNo") int promotionNo, Model model
//			) {
//		PromotionDto dto = promotionMapper.findByNo(promotionNo);
//		return "promotion/detail";//게시글 상세보기
//	}
	
//	@GetMapping("/promotion_list")
//	public String promotion_list(Model model) {
//		
//		List<PromotionDto> list = promotionMapper.list();
//		model.addAttribute("promotion_list",list);
//		return "promotion/list";//게시글 목록 
//	}
	
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";//게시글 등록
	}
	
	@GetMapping("/promotion_update_form")
	public String promotion_update_form() {
		return "promotion_update_form";//게시글 등록
	}
}
