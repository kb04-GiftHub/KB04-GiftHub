package mulcam.kb04.gifthub.GiftHub.controller;

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
import java.util.UUID;

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
	public String gifticon_use() {
		return "gifticon/use";
	}
	
	@PostMapping("/gifticon/buy")
	public String product_duy(@RequestParam("productNo") int productNo, 
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
		gift.setCustomerId(customerId);
		gift.setBuyNo(buy.getBuyNo());
		gift.setGiftBarcode(barcodeName);
		gift.setGiftExp(expDate);
		gift.setGiftStatus(0);
		gift = productService.createGifticon(gift);
		
		ServletContext app=ses.getServletContext();
		String directory=app.getRealPath("/resources/Gificon");
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
		
		MessageDto messageDto = new MessageDto(sendTel,"GiftHub","구매하신 기프티콘이 발송되었습니다. 이용 문의가 필요하시면 010-xxxx-xxxx으로 연락주시기 바랍니다.");
		
		MmsResponseDto mmsResponse = mmsService.sendSms(dto);
		SmsResponseDto response = smsService.sendSms(messageDto, mmsResponse);
		
		redirect.addFlashAttribute("msg", "성공적으로 기프티콘을 구입하였습니다.");
		
		
//		File file = new File(upDir);
//		file.delete();
		return "redirect:/product/detail?productNo="+productNo;
	}
	
	@PostMapping("/gifticon/use_action")
	public String gifticon_use_action(
			@RequestParam("image") MultipartFile file, 
			HttpSession ses, Model m) {
		ServletContext app=ses.getServletContext();
//		String upDir=app.getRealPath("/resources/User_Image");
		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
		upDir+="/src/main/resources/static/upload_images/gifticon";
		File dir=new File(upDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(file != null) {
			
			String originFname=file.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String newfilename=uuid.toString()+"_"+originFname;
			
			//새로운 이미지 업로드
			try {
				file.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
			}
		}
		
		return "redirect:/gifticon/use";
	}
	
	@PostMapping("/gifticon/image_use")
	public String image_use(@RequestParam MultipartFile image, Model model, HttpSession ses) throws IOException, NotFoundException {
		
		String giftNoStr;
		try {
			Map<DecodeHintType, Object> hints = new HashMap<>();
			hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
			
			byte[] bytes = image.getBytes();
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
			BufferedImage image1 = ImageIO.read(byteArrayInputStream);
			
			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image1)));
			Result result = new MultiFormatReader().decode(binaryBitmap, hints);
			
			giftNoStr = result.getText();
			long giftNo = Long.parseLong(giftNoStr);
			
			GiftDto giftDto = gifticonService.findGiftBygiftNo(giftNo);
			if(giftDto == null) {
				model.addAttribute("Msg","해당 번호는 유효하지않습니다");
				model.addAttribute("loc","gifticon/use");
				return "msg";
			}
			
			System.out.println(giftNo);
			
			return "redirect:/gifticon/use";
		} catch (NotFoundException e) {
			e.printStackTrace();
			model.addAttribute("Msg","해당 이미지는 유효하지않습니다");
			model.addAttribute("loc","gifticon/use");
			return "msg";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("Msg","해당 이미지는 유효하지않습니다");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}catch (NumberFormatException e) {
			e.printStackTrace();
			model.addAttribute("Msg","해당 바코드는 유효하지않습니다");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}catch (NullPointerException e) {
			e.printStackTrace();
			model.addAttribute("Msg","해당 기프티콘번호가 없습니다.");
			model.addAttribute("loc","gifticon/use");
			return "msg";
		}
	}
	
	@PostMapping("/gifticon/code_use")
	public String code_use(@RequestParam int gifticonNo, Model model, HttpSession ses) {
		System.out.println(gifticonNo);
		return "redirect:/gifticon/use";
	}
	
//	@GetMapping("/gifticon/barcode_generate")
//	public String barcode_generate(@RequestParam String userId, Model model, HttpSession ses) {
//		
//		// 바코드 생성을 위한 설정
//        int width = 400; // 이미지 너비
//        int height = 100; // 이미지 높이
//        String format = "png"; // 이미지 형식
//
//        Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
//        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
//        
//        // 바코드 생성을 위한 코드(날짜와시간+시퀀스)
//        String unique=UniqueCode.generateUniqueBarcode();
//        String barcodeData = unique;
//        
//        // 바코드 생성
//        BitMatrix bitMatrix;
//		try {
//			bitMatrix = new MultiFormatWriter().encode(
//			        barcodeData,
//			        BarcodeFormat.CODE_128, // 바코드 형식 선택
//			        width,
//			        height,
//			        hints
//			);
//
//	        // BitMatrix를 BufferedImage로 변환
//	        BufferedImage barcodeImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//	        for (int x = 0; x < width; x++) {
//	            for (int y = 0; y < height; y++) {
//	                barcodeImage.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF);
//	            }
//	        }
//	        
//	        // 바코드 이미지를 루트 디렉토리에 저장
//	        ServletContext app=ses.getServletContext();
//			String rootDirectory=app.getRealPath("/resources/Gificon");
//	        String filePath = rootDirectory + "/bar"+unique+"." + format;
//	        File outputFile = new File(filePath);
//	        File dir=new File(rootDirectory);
//			if(!dir.exists()){
//				dir.mkdirs();
//			}
//	        ImageIO.write(barcodeImage, format, outputFile);
//	        System.out.println("등록완료");
//		} catch (WriterException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
////		GiftoconGenerator.createGiftCard(ses);
//		return "redirect:/gifticon/use";
//	}
	
	@GetMapping("/gifticon/useList")
	public String useList(Model model) {
		String storeId = "store01";
		List<Object[]> list = gifticonService.listByStoreId(storeId);
		
        
		model.addAttribute("gifticonUsedList", list);
		return "gifticon/useList";
	}
	
}
