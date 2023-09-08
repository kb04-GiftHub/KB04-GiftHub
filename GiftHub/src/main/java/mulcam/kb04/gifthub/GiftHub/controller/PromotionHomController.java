package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;
import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.PromotionRepository;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;

@Controller
public class PromotionHomController {

	//게시물 등록 폼  
	@GetMapping("/promotion_insert_form")
    public String promotionInsertForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        return "promotion_insert_form";
    }
	//게시물 등록 처리 
	@PostMapping("/promotion_insert")
	public String addPromotion(@ModelAttribute PromotionDto dto,
	                           @RequestParam("promotionImage") MultipartFile file,
	                           HttpServletRequest request) {
	    if (!file.isEmpty()) {
	        // 파일 처리 코드 (서버에 파일 저장 및 DB에 파일 경로 저장)
	        try {
	            byte[] bytes = file.getBytes();
	            Path path = Paths.get(request.getServletContext().getRealPath("/images/") + file.getOriginalFilename());
	            Files.write(path, bytes);
	            dto.setPromotionImage("/images/" + file.getOriginalFilename());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    String storeIdString = "store1234";
		Store storeId = storeRepository.findById(storeIdString).orElse(null);
		
		Promotion promo = new Promotion();
		promo.setPromotionTitle(dto.getPromotionTitle());
		promo.setPromotionContent(dto.getPromotionContent());
		promo.setStoreId(storeId);
		promo.setPromotionType(dto.promotionType);
		promo.setPromotionImage(dto.promotionImage); // 이미지 URL 세팅

		Promotion savedPromo = PromotionRepository.save(promotion); 

		return "redirect:/";
	}
	
	//게시물 목록 
	@Autowired
    private PromotionRepository promotionRepository;
	@Autowired
	private StoreRepository storeRepository;

	@GetMapping("/promotion_list")
	public String promotionList(Model model) {
	String storeIdString = "store1234";
	Store storeId = storeRepository.findById(storeIdString).orElse(null);
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

	//게시글 상세페이지에서 이동한 삭제 폼
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";
	}
	 //게시글 삭제 처리
	 @GetMapping("/promotion_delete")
	 public String promotionDelete(@RequestParam("promotionNo") int promotionNo,@RequestParam("promotionTitle") String promotionTitle) {
	        promotionRepository.deleteById(promotionNo);
	        return "redirect:/promotion_list";
	    }
	 
	//게시글 상세페이지에서 이동한 수정 폼
	@GetMapping("/promotion_update_form")
	public String promotion_update_form() {
		return "promotion_update_form";
}
	//게시글 수정 처리
	    @PostMapping("/promotion_update")
	    public String promotionUpdate(@RequestParam("promotionNo") int promotionNo, @RequestParam("promotionTitle") String promotionTitle, @RequestParam("storeId") Store storeId, @RequestParam("promotionContent") String promotionContent) {
	        Promotion promotion = promotionRepository.findById(promotionNo).orElse(null);
	        if (promotion != null) {
	            promotion.setPromotionTitle(promotionTitle);
	            promotion.setStoreId(storeId);
	            promotion.setPromotionContent(promotionContent);
	            promotionRepository.save(promotion);
	        }
	        return "redirect:/promotion_list";
	    }	
	
	//게시글 삭제 기능
	@PostMapping("/delete_promotion")
	public String deletePromotion(@RequestParam("promotionNo") Integer promotionNo) {
	    promotionRepository.deleteById(promotionNo);
	    return "redirect:/promotion_list";
	}

	//게시글 수정 기능
	@PostMapping("/update_promotion")
	public String updatePromotion(@ModelAttribute Promotion promotion) {
	    if (Objects.nonNull(promotion.getPromotionNo())) {
	        Optional<Promotion> existingPromo = promotionRepository.findById(promotion.getPromotionNo());
	        if (existingPromo.isPresent()) {
	            Promotion updatedPromo = existingPromo.get();
	            updatedPromo.setStoreId(promotion.getStoreId());
	            updatedPromo.setPromotionTitle(promotion.getPromotionTitle());
	            updatedPromo.setPromotionContent(promotion.getPromotionContent());
	            // 여기에 필요한 필드들이 더 있다면 추가하세요.
	            promotionRepository.save(updatedPromo);
	        }
	    }
	    
	    return "redirect:/promo_list";
	}
	
	
	//사용자 커뮤니티 view
	//사용자(가맹점주X) 게시글 목록 보기
	@GetMapping("/promotionView")
	public String promotionView() {
		return "promotionView";
}
	//사용자(가맹점주X) 게시글 목록에서 이동한 사용자 게시글 상세 보기
	@GetMapping("/promotionView_detail")
	public String promotionView_detail() {
		return "promotionView_detail";
}

}