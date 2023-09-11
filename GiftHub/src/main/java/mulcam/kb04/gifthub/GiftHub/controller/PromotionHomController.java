package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import mulcam.kb04.gifthub.GiftHub.service.PromotionService;

@Controller
public class PromotionHomController {

	@Autowired
	private PromotionService promotionService;
	
	//게시물 등록 폼  
	@GetMapping("/promotion_insert_form")
    public String promotionInsertForm(Model model, HttpSession ses) {
		ses.setAttribute("storeId", "store1234");
        model.addAttribute("promotion", new Promotion());
        return "promotion_insert_form";
    }
	
      //게시물 등록 처리 
	@PostMapping("/promotion_insert")
	  public String insertPromotion(@RequestParam("promotionType") int promotionType,
	    		@RequestParam("promotionTitle") String promotionTitle, 
	    		@RequestParam("promotionContent") String promotionContent,
	    		@RequestParam("promotionImage") MultipartFile promotionImage,
	    		Model model) {
		
		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
		upDir+="/src/main/resources/static/upload_images/promotion";
		File dir=new File(upDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		String newfilename ="";
		if(promotionImage != null) {
			String originFname=promotionImage.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			newfilename=uuid.toString()+"_"+originFname;
			
			//새로운 이미지 업로드
			try {
				promotionImage.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
				
			}
		}
		
		 PromotionDto dto = new PromotionDto();
		 dto.setPromotionContent(promotionContent);
		 dto.setPromotionType(promotionType);
		 dto.setPromotionTitle(promotionTitle);
		 dto.setPromotionImage(newfilename);
		 dto.setStoreId("store1234");
	     dto = promotionService.insertPromotion(dto);
		
	     return "redirect:/promotion_list";
	   }
	
	
	//게시물 목록 
	@GetMapping("/promotion_list")
	public String promotionList(Model model) {
	String storeIdString = "store1234";
	List<PromotionDto> promotionList = promotionService.findByStoreId(storeIdString);
	model.addAttribute("promotion_list", promotionList);

	return "promotion_list";
	}
	
	//게시물 목록에서 이동한 상세 페이지
	@GetMapping("/promotion_detail")
	public String promotionDetail(@RequestParam("promotionNo") int promotionNo, Model model) {
        PromotionDto promotionDto = promotionService.findByPromotionNo(promotionNo);
        model.addAttribute("promotion", promotionDto);
        return "promotion_detail";
    }

	//게시글 상세페이지에서 이동한 삭제 폼
	@GetMapping("/promotion_delete_form")
	public String promotion_delete_form() {
		return "promotion_delete_form";
	}
	 //게시글 삭제 처리
	@GetMapping("/promotion_delete")
    public String promotionDelete(@RequestParam("promotionNo") int promotionNo, @RequestParam("promotionTitle") String promotionTitle) {
        promotionService.deleteBypromotionNo(promotionNo);
        return "redirect:/promotion_list";
    }
	 //게시물 수정 폼 
	 @GetMapping("/promotion_update_form")
	 public String promotionUpdateForm(@RequestParam("promotionNo") int promotionNo, Model model) {
		 PromotionDto dto = promotionService.findByPromotionNo(promotionNo);
     if (dto != null) {
	         model.addAttribute("promotion", dto);
	     }
	     return "promotion_update_form";
	 }
	 
	//게시글 수정 처리
	 @PostMapping("/update_promotion_submit")
	    public String promotionUpdate(@RequestParam("promotionNo") int promotionNo,
	    		@RequestParam("promotionType") int promotionType,
	    		@RequestParam("promotionTitle") String promotionTitle, 
	    		@RequestParam("promotionContent") String promotionContent,
	    		@RequestParam("promotionImage") MultipartFile promotionImage,
	    		Model model
	    		) {
		 
			String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
			upDir+="/src/main/resources/static/upload_images/promotion";
			File dir=new File(upDir);
			if(!dir.exists()){
				dir.mkdirs();
			}
			String newfilename ="";
			if(promotionImage != null) {
				String originFname=promotionImage.getOriginalFilename();
				UUID uuid=UUID.randomUUID();
				newfilename=uuid.toString()+"_"+originFname;
				
				//새로운 이미지 업로드
				try {
					promotionImage.transferTo(new File(upDir,newfilename));
				}catch(Exception e) {
					
				}
			}
		 
		 PromotionDto dto = promotionService.findByPromotionNo(promotionNo);
		 dto.setPromotionContent(promotionContent);
		 dto.setPromotionType(promotionType);
		 dto.setPromotionTitle(promotionTitle);
		 dto.setPromotionImage(newfilename);
	     dto = promotionService.save(dto);
	        return "redirect:/promotion_list";
	 }	
	   
//	//사용자 커뮤니티 view
//	//사용자(가맹점주X) 게시글 목록 보기
//	@GetMapping("/promotionView")
//	public String promotionView() {
//		return "promotionView";
//}
//	//사용자(가맹점주X) 게시글 목록에서 이동한 사용자 게시글 상세 보기
//	@GetMapping("/promotionView_detail")
//	public String promotionView_detail() {
//		return "promotionView_detail";
//}

}
