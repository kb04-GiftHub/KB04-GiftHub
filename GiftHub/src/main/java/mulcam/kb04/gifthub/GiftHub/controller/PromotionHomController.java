package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;
import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.service.PromotionService;

@Controller
public class PromotionHomController {

	@Autowired
	private PromotionService promotionService;

	//게시물 등록 폼  
	@GetMapping("/promotion_store/promotion_insert_form")
    public String promotionInsertForm(Model model, HttpSession ses) {		
//		String loggedId = (String)ses.getAttribute("loggedStoreId");
//		ses.setAttribute("storeId", "store1234");
        model.addAttribute("promotion", new Promotion());
        return "promotion_store/promotion_insert_form";
    }
	
      //게시물 등록 처리 
	@PostMapping("/promotion_store/promotion_insert")
	  public String insertPromotion(@RequestParam("promotionType") int promotionType,
	    		@RequestParam("promotionTitle") String promotionTitle, 
	    		@RequestParam("promotionContent") String promotionContent,
	    		@RequestParam("promotionImage") MultipartFile promotionImage,
	    		Model model, HttpSession ses) {
		
		String loggedId = (String)ses.getAttribute("loggedStoreId");
		//이미지 저장 
//		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
//		upDir+="/src/main/resources/static/upload_images/promotion";
		ServletContext app=ses.getServletContext();
		String upDir = app.getRealPath("/resources/promotion_img");
		
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
		 dto.setStoreId(loggedId);
	     dto = promotionService.insertPromotion(dto);
		
	     return "redirect:/promotion_store/promotion_list";
	   }
	
	
	//게시물 목록 
	@GetMapping("/promotion_store/promotion_list") //내가 주소창에 치는거
	public String promotionList(Model model, HttpSession ses) {
//	String storeIdString = "store1234";
	String storeIdString = (String) ses.getAttribute("loggedStoreId");
	List<PromotionDto> promotionList = promotionService.findByStoreId(storeIdString);
	model.addAttribute("promotion_list", promotionList);

	return "promotion_store/promotion_list";//리턴할 jsp, 이 페이지가 들어있는 경로를 써야해
	}
	
	//게시물 목록에서 이동한 상세 페이지
	@GetMapping("/promotion_store/promotion_detail")
	public String promotionDetail(@RequestParam("promotionNo") int promotionNo, Model model, HttpSession ses) {
        PromotionDto promotionDto = promotionService.findByPromotionNo(promotionNo);
        model.addAttribute("promotion", promotionDto);
        return "promotion_store/promotion_detail";
    }
	
		//게시글 상세페이지에서 이동한 삭제 폼
		@GetMapping("/promotion_store/promotion_delete_form")
		public String promotion_delete_form(HttpSession ses) {
			return "promotion_store/promotion_delete_form";
		}
		
		 //게시글 삭제 처리
		@GetMapping("/promotion_store/promotion_delete")
	    public String promotionDelete(@RequestParam("promotionNo") int promotionNo, HttpSession ses) {
	        promotionService.deleteBypromotionNo(promotionNo);
	        return "redirect:/promotion_store/promotion_list";
	    }
		
		
	 //게시물 수정 폼 
	 @GetMapping("/promotion_store/promotion_update_form")
	 public String promotionUpdateForm(@RequestParam("promotionNo") int promotionNo, Model model, HttpSession ses) {
		 PromotionDto dto = promotionService.findByPromotionNo(promotionNo);
     if (dto != null) {
	         model.addAttribute("promotion", dto);
	     }
	     return "promotion_store/promotion_update_form";
	 }
	 
	//게시글 수정 처리
	 @PostMapping("/promotion_store/update_promotion_submit")
	    public String promotionUpdate(@RequestParam("promotionNo") int promotionNo,
	    		@RequestParam("promotionType") int promotionType,
	    		@RequestParam("promotionTitle") String promotionTitle, 
	    		@RequestParam("promotionContent") String promotionContent,
	    		@RequestParam("promotionImage") MultipartFile promotionImage,
	    		Model model, HttpSession ses
	    		) {
		 	PromotionDto dto = promotionService.findByPromotionNo(promotionNo);
			String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
			upDir+="/src/main/webapp/resources/promotion_img";
			File dir=new File(upDir);
			if(!dir.exists()){
				dir.mkdirs();
			}
			String newfilename ="";
			
			if (promotionImage == null || promotionImage.isEmpty()) {
			    // 이미지가 업로드되지 않은 경우, 기존 파일 이름을 사용
			    newfilename = dto.getPromotionImage();
			} else {
			    // 이미지가 업로드된 경우, 새로운 파일 이름 생성 및 업로드
			    String originFname = promotionImage.getOriginalFilename();
			    UUID uuid = UUID.randomUUID();
			    newfilename = uuid.toString() + "_" + originFname;

			    // 새로운 이미지 업로드
			    try {
			        promotionImage.transferTo(new File(upDir, newfilename));
			    } catch (Exception e) {
			        // 업로드 실패 시 처리
			    }
			}
		 
		 dto = promotionService.findByPromotionNo(promotionNo);
		 dto.setPromotionContent(promotionContent);
		 dto.setPromotionType(promotionType);
		 dto.setPromotionTitle(promotionTitle);
		 dto.setPromotionImage(newfilename);
	     dto = promotionService.save(dto);
	        return "redirect:/promotion_store/promotion_list";
	 }
	 
	 
	
	//사용자 커뮤니티 view
	//사용자(가맹점주X) 게시글 목록 보기
	 @GetMapping("/promotion_member/promotionView_list")
	    public String promotionView_list(Model model) {
	        List<PromotionDto> promotions = promotionService.getAllPromotions();
	        model.addAttribute("promotions", promotions);
	        return "promotion_member/promotionView_list";
	    }
	 
	//사용자(가맹점주X) 게시글 목록에서 이동한 사용자 게시글 상세 보기
	@GetMapping("/promotion_member/promotionView_detail")
	public String promotionView_detail(@RequestParam("promotionNo") int promotionNo, Model model) {
        Object list = promotionService.findPromotionAndStore(promotionNo);
        model.addAttribute("promotion", list);
        
        //지도
        Gson gson = new Gson();
        String jsonStores = gson.toJson(list);
        model.addAttribute("stores", jsonStores);
        System.out.println(jsonStores);
		return "promotion_member/promotionView_detail";
}
	//전통시장 
		@GetMapping("/promotion_store/promotionMarket_list")
		public String promotionMarketList() {
			
			return "promotion_store/promotionMarket_list";
		}

}
