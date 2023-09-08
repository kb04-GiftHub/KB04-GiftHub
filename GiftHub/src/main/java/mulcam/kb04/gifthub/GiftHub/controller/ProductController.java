package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
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
	//private ProductService productService;
	private ProductRepository repository;

	@GetMapping("/about")
	public String gifticon_add() {
		
		return "gifticon/add_form";
	}

	@PostMapping("/gifticon/insert_action")
	public String gifticon_insert_action(
			@RequestParam("chooseFile") MultipartFile file,
			@RequestParam("name") String productName, 
			@RequestParam("sellingPrice") int productPrice, 
			@RequestParam("productDescription") String productMemo,
			@RequestParam("expiry") String productExp,
			HttpSession ses){
		

		// 이미지 저장
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
		
		
		Product product = new Product();
		Store store = new Store();
		store.setStoreId("store01");
		product.setProductImage(newfilename);
		product.setProductExp(Integer.parseInt(productExp.substring(0,2)));
		product.setProductName(productName);
		product.setProductPrice(productPrice);
		product.setProductMemo(productMemo);
		product.setStoreId(store);
		
		repository.save(product);
		
		
//		product.setProductExp(produectExp);
		
		
		
//		// dto 생성
//		ProductDto productDto = new ProductDto();
//		productDto.setProductName(productName);
//		productDto.setProductPrice(productPrice);
//		productDto.setProductMemo(productMemo);
//		//productDto.setProductExp(productExp);
//		productDto.setProductImage(newfilename);
//		
//		
//		
//		productService.insertProduct(productDto);
		
		return "gifticon/add_ok";
	} 

}
