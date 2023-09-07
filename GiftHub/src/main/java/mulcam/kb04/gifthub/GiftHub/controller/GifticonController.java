package mulcam.kb04.gifthub.GiftHub.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import mulcam.kb04.gifthub.GiftHub.project.GiftoconGenerator;
import mulcam.kb04.gifthub.GiftHub.project.UniqueCode;


@Controller
public class GifticonController {
	
	@GetMapping("/about")
	public String gifticon_add() {
		//model.addAttribute("msg", msg);
		
		//return "project";
		return "gifticon/add_form";
	}
	
	@GetMapping("/gifticon/use")
	public String gifticon_use() {
		return "gifticon/use";
	}
	
	@PostMapping("/gifticon/use_action")
	public String gifticon_use_action(
			@RequestParam("image") MultipartFile file, 
			HttpSession ses, Model m) {
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/User_Image");
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
		String rootDirectory = System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
		System.out.println(rootDirectory);
		return "redirect:/gifticon/use";
	}
	
	@GetMapping("/gifticon/barcode_generate")
	public String barcode_generate(@RequestParam String userId, Model model, HttpSession ses) {
		
//		 // 바코드 생성을 위한 설정
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
		
		GiftoconGenerator.createGiftCard(ses);
		return "redirect:/gifticon/use";
	}
	
	
}
