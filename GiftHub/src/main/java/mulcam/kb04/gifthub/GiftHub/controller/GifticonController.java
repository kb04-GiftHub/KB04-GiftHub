package mulcam.kb04.gifthub.GiftHub.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;

import mulcam.kb04.gifthub.GiftHub.project.GiftoconGenerator;
import mulcam.kb04.gifthub.GiftHub.project.UniqueCode;
import mulcam.kb04.gifthub.GiftHub.service.GifticonService;


@Controller
public class GifticonController {
	
	@Autowired
	GifticonService gifticonService;
	
	@GetMapping("/gifticon/use")
	public String gifticon_use() {
		return "gifticon/use";
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
//			String newfilename="123.png";
			
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
		
		Map<DecodeHintType, Object> hints = new HashMap<>();
        hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
        
        byte[] bytes = image.getBytes();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        BufferedImage image1 = ImageIO.read(byteArrayInputStream);
        
        BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image1)));
        Result result = new MultiFormatReader().decode(binaryBitmap, hints);
		
        String giftNo = result.getText();
        
        System.out.println(giftNo);
        
		return "redirect:/gifticon/use";
	}
	
	@PostMapping("/gifticon/code_use")
	public String code_use(@RequestParam int gifticonNo, Model model, HttpSession ses) {
		System.out.println(gifticonNo);
		return "redirect:/gifticon/use";
	}
	
	@GetMapping("/gifticon/barcode_generate")
	public String barcode_generate(@RequestParam String userId, Model model, HttpSession ses) {
		
		// 바코드 생성을 위한 설정
        int width = 400; // 이미지 너비
        int height = 100; // 이미지 높이
        String format = "png"; // 이미지 형식

        Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        
        // 바코드 생성을 위한 코드(날짜와시간+시퀀스)
        String unique=UniqueCode.generateUniqueBarcode();
        String barcodeData = unique;
        
        // 바코드 생성
        BitMatrix bitMatrix;
		try {
			bitMatrix = new MultiFormatWriter().encode(
			        barcodeData,
			        BarcodeFormat.CODE_128, // 바코드 형식 선택
			        width,
			        height,
			        hints
			);

	        // BitMatrix를 BufferedImage로 변환
	        BufferedImage barcodeImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	        for (int x = 0; x < width; x++) {
	            for (int y = 0; y < height; y++) {
	                barcodeImage.setRGB(x, y, bitMatrix.get(x, y) ? 0x000000 : 0xFFFFFF);
	            }
	        }
	        
	        // 바코드 이미지를 루트 디렉토리에 저장
	        ServletContext app=ses.getServletContext();
			String rootDirectory=app.getRealPath("/resources/Gificon");
	        String filePath = rootDirectory + "/bar"+unique+"." + format;
	        File outputFile = new File(filePath);
	        File dir=new File(rootDirectory);
			if(!dir.exists()){
				dir.mkdirs();
			}
	        ImageIO.write(barcodeImage, format, outputFile);
	        System.out.println("등록완료");
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		GiftoconGenerator.createGiftCard(ses);
		return "redirect:/gifticon/use";
	}
	
	@GetMapping("/gifticon/useList")
	public String useList(Model model) {
		String storeId = "store01";
		List<Object[]> list = gifticonService.listByStoreId(storeId);
		
        
		model.addAttribute("gifticonUsedList", list);
		return "gifticon/useList";
	}
	
}
