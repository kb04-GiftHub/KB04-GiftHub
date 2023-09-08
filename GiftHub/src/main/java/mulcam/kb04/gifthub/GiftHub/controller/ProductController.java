package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.ProductRepository;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
//	private ProductRepository repository;

	@GetMapping("/about")
	public String gifticon_add() {
		
		return "product/add_form";
	}

	@PostMapping("/product/insert_action")
	public String gifticon_insert_action(
			@RequestParam("chooseFile") MultipartFile file,
			@RequestParam("name") String productName, 
			@RequestParam("sellingPrice") int productPrice, 
			@RequestParam("productDescription") String productMemo,
			@RequestParam("expiry") String productExp,
			HttpSession ses){
		

		// [1] 이미지 저장
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/products");
		File dir=new File(upDir);
		String newfilename = null;
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(file != null) {

			String originFname=file.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			newfilename=uuid.toString()+"_"+originFname;



			//새로운 이미지 업로드
			try {
				file.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
			}
		}
		
		
		// [2] 유효기간 설정
		// '일'을 추출하고 숫자로 파싱
	    String daysSubstring = productExp.replaceAll("[^0-9]", "");
	    int daysToAdd = Integer.parseInt(daysSubstring);
	    // 현재 날짜 가져오기
	    Calendar calendar = Calendar.getInstance();
	    Date currentDate = calendar.getTime();
	    // 날짜 더하기
	    calendar.setTime(currentDate);
	    calendar.add(Calendar.DATE, daysToAdd);
	    // 결과 날짜
	    Date expiryDate = calendar.getTime();
	   
 
		// [3] dto 생성
		ProductDto productDto = new ProductDto();
		
		productDto.setProductPrice(productPrice);
		productDto.setProductName(productName);
		productDto.setProductMemo(productMemo);
		productDto.setProductExp(expiryDate);
		productDto.setProductImage(newfilename);
		productDto.setStoreId("store01");
		
		productService.save(productDto);
		System.out.println("등록완료");
		
		return "product/add_ok";
	} 

}
