package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.project.GifticonGenerator;
import mulcam.kb04.gifthub.GiftHub.project.UniqueCode;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//모든 물품 정보 가져오기
	@GetMapping("/allProduct")
	@ResponseBody
	public List<StoreDto> allStores() {
		List<StoreDto> list = productService.allStores(); 
		return list;
	}
	
	@GetMapping("/product")
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
			HttpSession ses, Model model){
		
		String loggedId = (String)ses.getAttribute("loggedStoreId");

		// [1] 이미지 저장

		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
		upDir+="/src/main/resources/static/upload_images/product";
		
		File dir=new File(upDir);
		String newfilename = null;
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		if(file != null) {

			String originFname=file.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			newfilename=originFname;


			//새로운 이미지 업로드
			try {
				file.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
			}
		}
		
		ServletContext app=ses.getServletContext();
		String imageDir=app.getRealPath("/resources/products");
		File imgDir = new File(imageDir);
		if(!imgDir.exists()) {
			imgDir.mkdirs();
		}
		if(file != null) {
			//새로운 이미지 업로드
			try {
				file.transferTo(new File(imageDir,newfilename));
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
		productDto.setStoreId(loggedId);			// 수정할 부분
		
		ProductDto dto = productService.save(productDto);
		System.out.println("등록완료");
		
		model.addAttribute("dto", dto);
		
		
		System.out.println(productDto);
		return "product/add_ok";
	} 
	
	@GetMapping("/product/list")
	public String product_list(Model model, HttpSession ses) {
		
		List<Object[]> list = productService.allProducts();
		model.addAttribute("productList", list);
		
		CustomerDto dto = (CustomerDto) ses.getAttribute("user");
		ses.setAttribute("user",dto);
		
		return "product/list";
	}
	
	@GetMapping("/product/myList")
	public String product_myList(Model model, HttpSession ses) {
		
		String loggedStoreId = (String) ses.getAttribute("loggedStoreId");
		/*
		 * if(loggedStoreId == null || ses.getAttribute("loggedStroeId") != null) {
		 * return "redirect:/index"; }
		 */
		Date now = new Date();
		List<ProductDto> myList = productService.findByStoreIdToList(loggedStoreId);
		model.addAttribute("myList", myList);
		model.addAttribute("nowDate", now);
		for (ProductDto dto : myList) {
			System.out.println(dto);
		}
		return "product/myList";
	}
	
	@GetMapping("/product/myList/product_detail")
	public String myproduct_detail(
			@RequestParam("productNo") int productNo) {
		
		
		
		
		return "product/myDetail";
	}
	@GetMapping("/product/detail/{productNo}")
	public String product_detail(@PathVariable("productNo") int productNo , Model model, HttpSession ses) {
		if(ses.getAttribute("user") == null ) {
			model.addAttribute("Msg","로그인이 필요한 기능입니다");
			model.addAttribute("loc","member/login");
			ses.invalidate();
			return "msg";
		}
		
		ProductDto dto = productService.findByProductNo(productNo);
		model.addAttribute("product",dto);
		
		StoreDto storeDto = productService.findByStoreId(dto.getStoreId());
		model.addAttribute("store", storeDto);
		
		return "product/detail";
	}
	
	@GetMapping("/product/buy")
	public String product_duy(@RequestParam int productNo, @RequestParam String customerId, 
			Model model, HttpSession ses) throws Exception {
		//회원객체와 상품객체 불러오기
		CustomerDto customer = productService.findByCustomerId(customerId);
		ProductDto product = productService.findByProductNo(productNo);
		StoreDto store = productService.findByStoreId(product.getStoreId());
		//포인트 유무(부족하면 msg보내기)
		if(customer.getPoint() < product.getProductPrice()) {
			model.addAttribute("Msg","포인트가 부족합니다");
			model.addAttribute("loc","product/detail/"+productNo);
			return "msg";
		}
		//포인트 차감
		customer.setPoint(customer.getPoint()-product.getProductPrice());
		productService.payPoint(customer);
		ses.setAttribute("user", customer);
		
		BuyDto buy = new BuyDto();
		buy.setStoreId(store.getStoreId());
		buy.setProductNo(productNo);
		buy.setBuyPrice(product.getProductPrice());
		buy.setBuyerId(customerId);
		buy.setBuyDate(new Date());
		buy = productService.buyProduct(buy);
		
		//기프티콘 생성
		String unique=UniqueCode.generateUniqueBarcode();//기프티콘 고유번호
		Long giftNo = Long.parseLong(unique);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(product.getProductExp());
        calendar.add(Calendar.MONTH, 1);
        Date expDate = calendar.getTime();
		String barcodeName = GifticonGenerator.createGiftCard(ses,product,unique,store,expDate);
		
		GiftDto gift = new GiftDto();
		gift.setGiftNo(giftNo);
		gift.setCustomerId(customerId);
		gift.setBuyNo(buy.getBuyNo());
		gift.setGiftBarcode(barcodeName);
		gift.setGiftExp(expDate);
		gift.setGiftStatus(0);
		
		gift = productService.createGifticon(gift);
		
		return "redirect:/product/list";
	}
}
