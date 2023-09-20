package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import lombok.extern.slf4j.Slf4j;
import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.project.GifticonGenerator;
import mulcam.kb04.gifthub.GiftHub.project.UniqueCode;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;

@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//검색 가게 정보 가져오기
	@GetMapping("/findStores")
	@ResponseBody
	public List<StoreDto> findStores(@RequestParam String storeName){
		List<StoreDto> list = new ArrayList<>();
		list = productService.findStores(storeName);
		return list;
	}
	
	//모든 가게 정보 가져오기
	@GetMapping("/allStores")
	@ResponseBody
	public List<StoreDto> allStores(@RequestParam int categoryNum) {
		List<StoreDto> list = new ArrayList<>(); 
		if(categoryNum == 0) {
			list = productService.allStores();
		}else {
			list = productService.allStoresByCategoryNo(categoryNum);
		}
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
		
		ServletContext app=ses.getServletContext();
		String upDir = app.getRealPath("/resources/products");
//		upDir+="/src/main/webapp/resources/products";
//		upDir+="/src/main/resources/static/upload_images/product";
		System.out.println(upDir);
		
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
		
////		ServletContext app=ses.getServletContext();
//		String imageDir=app.getRealPath("/resources/products");
//		File imgDir = new File(imageDir);
//		if(!imgDir.exists()) {
//			imgDir.mkdirs();
//		}
//		if(file != null) {
//			//새로운 이미지 업로드
//			try {
//				file.transferTo(new File(imageDir,newfilename));
//			}catch(Exception e) {
//			}
//		}
		
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
		productDto.setStoreId(loggedId);
		productDto.setStatus(0);// 수정할 부분 
		
		ProductDto dto = productService.save(productDto);
		System.out.println("등록완료");
		
		model.addAttribute("dto", dto);
		
		
		System.out.println(productDto);
		return "product/add_ok";
	} 
	
	@GetMapping("/product/list")
	public String product_list(Model model, HttpSession ses) {
		ses.removeAttribute("msg");
		CustomerDto dto = (CustomerDto) ses.getAttribute("user");
		if(dto==null) {
			model.addAttribute("Msg","로그인이 필요한 기능입니다");
			model.addAttribute("loc","member/login");
			return "msg";
		}
		List<Object[]> list = productService.allProducts();
//		List<JjimDto> jList = productService.getJjimByCustomerId(dto.getCustomerId());
//		List<Integer> pList = new ArrayList<>();
//		List<Object[]> rList = new ArrayList<>(); 
//		Object[] oj = new Object[9];
//		for(JjimDto jdto : jList) {
//			pList.add(jdto.getProductNo());
//		}
//		if(jList == null) {
//			for(Object[] obj : list) {
//				oj[0] = obj[0];
//				oj[1] = obj[1];
//				oj[2] = obj[2];
//				oj[3] = obj[3];
//				oj[4] = obj[4];
//				oj[5] = obj[5];
//				oj[6] = obj[6];
//				oj[7] = obj[7];
//				oj[8] = obj[8];
//				oj[9] = 0;
//				rList.add(oj);
//			}
//			model.addAttribute("productList", rList);
//			return "product/list";
//		}
//		for(Object[] obj : list) {
//			oj[0] = obj[0];
//			oj[1] = obj[1];
//			oj[2] = obj[2];
//			oj[3] = obj[3];
//			oj[4] = obj[4];
//			oj[5] = obj[5];
//			oj[6] = obj[6];
//			oj[7] = obj[7];
//			oj[8] = obj[8];
//			if(pList.contains(obj[0])){
//				oj[9] = 1;
//			}else {
//				oj[9] = 0;
//			}
//			rList.add(oj);
//		}
		model.addAttribute("productList", list);
		return "product/list";
	}
	
	@GetMapping("/product/myList")
	public String product_myList(Model model, HttpSession ses) {
		
		String loggedStoreId = (String) ses.getAttribute("loggedStoreId");
		
		if(loggedStoreId == null || ses.getAttribute("loggedStroeId") != null) {
		 return "redirect:/index"; }
		
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
			@RequestParam("productNo") int productNo,
			HttpSession ses, Model model) {
		
		ProductDto dto = productService.findByProductNo(productNo);
		model.addAttribute("dto", dto);
		
		return "product/myDetail";
	}
	
	@PostMapping("/product/delete/{productNo}")
    public String delete_product(@PathVariable("productNo") int productNo,
    									Model model, HttpSession ses) {
		
		productService.deleteByProductNo(productNo);
		System.out.println(">> " + productNo + " 삭제완료");
		return "redirect:/product/myList"; // 삭제 후 목록 페이지로 이동
	}
	
	
	@GetMapping("/product/detail")
	public String product_detail(@RequestParam("productNo") int productNo , Model model, HttpSession ses) {
		if(ses.getAttribute("user") == null ) {
			model.addAttribute("Msg","로그인이 필요한 기능입니다");
			model.addAttribute("loc","member/login");
			//ses.invalidate();
			return "msg";
		}
		
		ProductDto dto = productService.findByProductNo(productNo);
		model.addAttribute("product",dto);
		CustomerDto cdto=(CustomerDto) ses.getAttribute("user");
		cdto=productService.findByCustomerId(cdto.getCustomerId());
		ses.setAttribute("user",cdto);
		StoreDto storeDto = productService.findByStoreId(dto.getStoreId());
		model.addAttribute("store", storeDto);
		
				
		JjimDto jdto = productService.findByProductNoCustomerId(productNo, cdto.getCustomerId());
		if(jdto == null) {
			jdto=new JjimDto();
			jdto.setJjimStatus(3);
			model.addAttribute("jdto",jdto);
		}else {
			model.addAttribute("jdto",jdto);
		}
		return "product/detail";
	}
	
	@PostMapping("/product/buy")
	public String product_duy(@RequestParam int productNo, 
			@RequestParam String customerId,
			@RequestParam String sendTel,
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
	
	@GetMapping("/product/idCheck")
	@ResponseBody
	public Map<String, String> idCheck(@RequestParam String customerId,@RequestParam String giftId, Model model, HttpSession ses){
		Map<String, String> map = new HashMap<>();
		CustomerDto dto = productService.findByCustomerId(giftId);
		CustomerDto cDto = productService.findByCustomerId(customerId);
		if(dto == null) {
			map.put("msg", "실패");
		}else if(cDto == dto) {
			map.put("msg", "실패");
		}else {
			map.put("msg", "성공");
		}
		return map;
	}
	
	@GetMapping("/product/jjimPlus")
	@ResponseBody
	public Map<String, Object> jjimPlus(
			@RequestParam("customerId") String customerId, 
			@RequestParam("productNo") int productNo,
			@RequestParam("jjimStatus") int jjimStatus,
			Model model, HttpSession ses){
		Map<String, Object> map = new HashMap<>();
			
		JjimDto jdto = new JjimDto();	
		
		if(jjimStatus == 3) {
			jdto = new JjimDto();
			jdto.setCustomerId(customerId);
			jdto.setProductNo(productNo);
			jdto.setJjimStatus(1);
			jdto = productService.jjimSave(jdto);
			map.put("msg","성공");
		}else if(jjimStatus == 2){
			jdto = productService.findByProductNoCustomerId(productNo, customerId);
			jdto.setJjimStatus(1);
			jdto = productService.jjimSave(jdto);
			map.put("msg","성공");
		}else if(jjimStatus == 1) {
			jdto = productService.findByProductNoCustomerId(productNo, customerId);
			jdto.setJjimStatus(2);
			jdto = productService.jjimSave(jdto);
			map.put("msg","성공");
		}
		map.put("jjimStatus", jdto.getJjimStatus());
		map.put("jdto", jdto);
		return map;
	}
	
	@GetMapping("/product/checkId")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String customerId){
		Map<String, Object> map = new HashMap<>();
		CustomerDto dto = productService.findByCustomerId(customerId);
		
		if(dto == null) {
			map.put("res", "실패");
		}else {
			map.put("res", "성공");
		}
		return map;
	}
	
	
	
	
}
