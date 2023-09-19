package mulcam.kb04.gifthub.GiftHub.controller;

import java.awt.FontFormatException;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.message.FilesDto;
import mulcam.kb04.gifthub.GiftHub.message.MessageDto;
import mulcam.kb04.gifthub.GiftHub.message.MmsResponseDto;
import mulcam.kb04.gifthub.GiftHub.message.MmsService;
import mulcam.kb04.gifthub.GiftHub.message.SmsResponseDto;
import mulcam.kb04.gifthub.GiftHub.message.SmsService;
import mulcam.kb04.gifthub.GiftHub.project.GifticonGenerator;
import mulcam.kb04.gifthub.GiftHub.project.UniqueCode;
import mulcam.kb04.gifthub.GiftHub.service.GifticonService;
import mulcam.kb04.gifthub.GiftHub.service.ProductService;


@Controller
public class GifticonController {
	
	@Autowired
	GifticonService gifticonService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	SmsService smsService;
	
	@Autowired
	MmsService mmsService;
	
	@GetMapping("/gifticon/use")
	public String gifticon_use(@RequestParam String storeId, Model model, HttpSession ses) {
		StoreDto dto=(StoreDto)ses.getAttribute("storeUser");
		ses.setAttribute("storeUser", dto);
		ses.setAttribute("loggedStoreId", storeId);
		return "gifticon/use";
	}
	
	@GetMapping("/gifticon/useList")
	public String gifticon_useList(
			@RequestParam(defaultValue="1") int cpage,
			@RequestParam String storeId, Model model,HttpSession ses) {
		StoreDto dto=(StoreDto)ses.getAttribute("storeUser");
		ses.setAttribute("storeUser", dto);
		ses.setAttribute("loggedStoreId", storeId);
		
//		//현재 페이지가 0보다 작거나 같을 경우 1로 지정
//		if(cpage<=0) {
//			cpage=1;
//		}
//		int totalNotice=gifticonService.totalCountGiftUsed(storeId);//전체 공지사항 수
//		int pageSize=10;//한 페이지당 보여줄 공지사항 수
//		int pageCount=(totalNotice-1)/pageSize+1;//총 페이지 수
//		//현재 페이지가 총 페이지 수 보다 클 경우
//		if(cpage>pageCount) {
//			cpage=pageCount;
//		}
//		//페이지에 가져올 공지사항 시작,끝
//		int end=cpage*pageSize;
//		int start=end-(pageSize-1);
//		//Map에 담아서 전달
//		Map<String,Integer> map=new HashMap<>();
//		map.put("start", start);
//		map.put("end",end);
//		model.addAttribute("cpage",cpage);
//		model.addAttribute("pageCount",pageCount);
		
		
		List<Object[]> list = gifticonService.listByStoreId(storeId);
		model.addAttribute("gifticonUsedList", list);
		return "gifticon/useList";
	}
	
	@PostMapping("/gifticon/buyId")
	public String product_buyId(@RequestParam("productNo") int productNo, 
			@RequestParam("customerId") String customerId,
			@RequestParam("sendId") String sendId, Model model, HttpSession ses
			,RedirectAttributes redirect) throws FontFormatException, IOException {
		
		//회원객체와 상품객체 불러오기
		CustomerDto customer = productService.findByCustomerId(customerId);
		ProductDto product = productService.findByProductNo(productNo);
		StoreDto store = productService.findByStoreId(product.getStoreId());
		
		//포인트 유무(부족하면 msg보내기)
		if(customer.getPoint() < product.getProductPrice()) {
			model.addAttribute("Msg","포인트가 부족합니다");
			model.addAttribute("loc","product/detail?productNo="+productNo);
			return "msg";
		}
		//포인트 차감
		customer.setPoint(customer.getPoint()-product.getProductPrice());
		productService.payPoint(customer);
		ses.setAttribute("user", customer);
		
		//스토어 포인트 추가
		store.setStorePoint(store.getStorePoint()+product.getProductPrice());
		store=gifticonService.updatePoint(store);
		
		//구매내역 생성
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
		gift.setCustomerId(sendId);
		gift.setBuyNo(buy.getBuyNo());
		gift.setGiftBarcode(barcodeName);
		gift.setGiftExp(expDate);
		gift.setGiftStatus(1);
		gift = productService.createGifticon(gift);
		
		ServletContext app=ses.getServletContext();
		String directory=app.getRealPath("/resources/Gifticon");
        String upDir = directory + "/"+barcodeName;
		
//		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
//		upDir+="/src/main/resources/static/upload_images/gifticon/"+barcodeName;
        
		String imagePath = upDir;
		
		File imageFile = new File(imagePath);
    	FileInputStream inputStream = new FileInputStream(imageFile);
    	byte[] imageBytes = new byte[(int) imageFile.length()];
		inputStream.read(imageBytes);
		inputStream.close();
		String base64Image = Base64.encodeBase64String(imageBytes);
		
		FilesDto dto = new FilesDto("GIFTHUB_gifticon.jpg",base64Image);
		
		redirect.addFlashAttribute("msg", "성공적으로 기프티콘을 선물하였습니다.");
		
		return "redirect:/product/detail?productNo="+productNo;
	}
	
	@PostMapping("/gifticon/buy")
	public String product_buy(@RequestParam("productNo") int productNo, 
			@RequestParam("customerId") String customerId,
			@RequestParam("sendTel") String sendTel,
			Model model, HttpSession ses,
			RedirectAttributes redirect) throws Exception {
		//회원객체와 상품객체 불러오기
		CustomerDto customer = productService.findByCustomerId(customerId);
		ProductDto product = productService.findByProductNo(productNo);
		StoreDto store = productService.findByStoreId(product.getStoreId());
		
		//포인트 유무(부족하면 msg보내기)
		if(customer.getPoint() < product.getProductPrice()) {
			model.addAttribute("Msg","포인트가 부족합니다");
			model.addAttribute("loc","product/detail?productNo="+productNo);
			return "msg";
		}
		//포인트 차감
		customer.setPoint(customer.getPoint()-product.getProductPrice());
		productService.payPoint(customer);
		ses.setAttribute("user", customer);
		
		//스토어 포인트 추가
		store.setStorePoint(store.getStorePoint()+product.getProductPrice());
		store=gifticonService.updatePoint(store);
		
		//구매내역 생성
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
        calendar.setTime(new Date());
        calendar.add(Calendar.MONTH, 1);
        Date expDate = calendar.getTime();
		String barcodeName = GifticonGenerator.createGiftCard(ses,product,unique,store,expDate);
		
		GiftDto gift = new GiftDto();
		gift.setGiftNo(giftNo);
		gift.setCustomerId(customerId);
		gift.setBuyNo(buy.getBuyNo());
		gift.setGiftBarcode(barcodeName);
		gift.setGiftExp(expDate);
		gift.setGiftStatus(1);
		gift = productService.createGifticon(gift);
		
		ServletContext app=ses.getServletContext();
		String directory=app.getRealPath("/resources/Gifticon");
        String upDir = directory + "/"+barcodeName;
		
//		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
//		upDir+="/src/main/resources/static/upload_images/gifticon/"+barcodeName;
        
		String imagePath = upDir;
		
		File imageFile = new File(imagePath);
    	FileInputStream inputStream = new FileInputStream(imageFile);
    	byte[] imageBytes = new byte[(int) imageFile.length()];
		inputStream.read(imageBytes);
		inputStream.close();
		String base64Image = Base64.encodeBase64String(imageBytes);
		
		FilesDto dto = new FilesDto("GIFTHUB_gifticon.jpg",base64Image);
		
		MessageDto messageDto = new MessageDto(sendTel,"GiftHub","[TEST]구매하신 기프티콘이 발송되었습니다.\n 이용 문의가 필요하시면 1544-9001으로 연락주세요.");
		
		MmsResponseDto mmsResponse = mmsService.sendSms(dto);
		SmsResponseDto response = smsService.sendSms(messageDto, mmsResponse);
		
		redirect.addFlashAttribute("msg", "성공적으로 기프티콘을 구입하였습니다.");
		
		
//		File file = new File(upDir);
//		file.delete();
		return "redirect:/product/detail?productNo="+productNo;
	}
	
	/*
	 * @PostMapping("/gifticon/use_action") public String gifticon_use_action(
	 * 
	 * @RequestParam("image") MultipartFile file, HttpSession ses, Model m) {
	 * ServletContext app=ses.getServletContext(); // String
	 * upDir=app.getRealPath("/resources/User_Image"); String
	 * upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
	 * upDir+="/src/main/resources/static/upload_images/gifticon"; File dir=new
	 * File(upDir); if(!dir.exists()){ dir.mkdirs(); } if(file != null) {
	 * 
	 * String originFname=file.getOriginalFilename(); UUID uuid=UUID.randomUUID();
	 * String newfilename=uuid.toString()+"_"+originFname;
	 * 
	 * //새로운 이미지 업로드 try { file.transferTo(new File(upDir,newfilename));
	 * }catch(Exception e) { } }
	 * 
	 * return "redirect:/gifticon/use";
	 
	}*/
	
	@PostMapping("/gifticon/image_use")
	public String image_use(@RequestParam MultipartFile image,
			@RequestParam String storeId,
			@RequestParam("customerId") String userId,
			Model model, HttpSession ses) throws IOException, NotFoundException {
		
		String giftNoStr = "1";
		Map<DecodeHintType, Object> hints = new HashMap<>();
		hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
		
		byte[] bytes = image.getBytes();
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
		BufferedImage image1 = ImageIO.read(byteArrayInputStream);
		
		if (image1 != null) {
            BinaryBitmap binaryBitmap = new BinaryBitmap(
            new HybridBinarizer(new BufferedImageLuminanceSource(image1)));
            Result result = new MultiFormatReader().decode(binaryBitmap, hints);
            giftNoStr = result.getText();
        }
		
//		BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image1)));
//		Result result = new MultiFormatReader().decode(binaryBitmap, hints);
//		giftNoStr = result.getText();
		
		StoreDto sdto = gifticonService.findByStoreId(storeId);
		ses.setAttribute("storeUser", sdto);
		
		if(giftNoStr.equals(1)) {
			model.addAttribute("Msg","이미지가 없습니다.");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}
		
		System.out.println(giftNoStr);
		long giftNo = Long.parseLong(giftNoStr);
		
		GiftDto giftDto = gifticonService.findGiftBygiftNo(giftNo);
		if(giftDto == null) {
			model.addAttribute("Msg","해당 쿠폰은 유효하지않습니다");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}else {
			giftDto.setGiftStatus(2);
			giftDto = gifticonService.updateStatus(giftDto);
			GiftUsedDto guDto = new GiftUsedDto();
//			guDto.setCustomerId();
			guDto.setGiftNo(giftNo);
			guDto.setUsedDate(new Date());
			guDto.setCustomerId(userId);
			model.addAttribute("Msg","쿠폰이 사용되었습니다.");
			model.addAttribute("loc","gifticon/use");
		}
		System.out.println(giftNo);
		return "msg";
	}
	
	@PostMapping("/gifticon/code_use")
	public String code_use(@RequestParam long gifticonNo,
			@RequestParam("customerId") String userId,
			@RequestParam String storeId,
			Model model, HttpSession ses) {
		
		StoreDto sdto = gifticonService.findByStoreId(storeId);
		ses.setAttribute("storeUser", sdto);
		
		long giftNo = gifticonNo;
		GiftDto giftDto = gifticonService.findGiftBygiftNo(giftNo);
		if(giftDto == null) {
			model.addAttribute("Msg","해당 쿠폰은 유효하지않습니다");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}else {
			giftDto.setGiftStatus(2);
			giftDto = gifticonService.updateStatus(giftDto);
			GiftUsedDto guDto = new GiftUsedDto();
//			guDto.setCustomerId();
			guDto.setGiftNo(giftNo);
			guDto.setUsedDate(new Date());
			guDto.setCustomerId(userId);
			guDto=gifticonService.saveGiftUsed(guDto);
			model.addAttribute("Msg","쿠폰이 사용되었습니다.");
			model.addAttribute("loc","gifticon/use");
		}
		System.out.println(giftNo);
		return "msg";
	}
	
}
