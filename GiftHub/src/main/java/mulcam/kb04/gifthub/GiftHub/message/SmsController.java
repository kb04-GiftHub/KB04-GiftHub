package mulcam.kb04.gifthub.GiftHub.message;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SmsController {
	
	@Autowired
	private final SmsService smsService;
	
	@Autowired
	private final MmsService mmsService;
	
	@Autowired
	private final SmsResultService resultService;
	
	@GetMapping("/send")
	public String getSmsPage() {
		return "sendSms";
	}
	
	@GetMapping(value="/sms/send")
	public String sendMms(Model model) throws RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, IOException  {
		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
		upDir+="/src/main/resources/static/upload_images/gifticon/29fed84e-23ca-4bed-91f3-727e4b029200_gifticon.jpg";
		String imagePath = upDir;
		
		File imageFile = new File(imagePath);
    	FileInputStream inputStream = new FileInputStream(imageFile);
    	byte[] imageBytes = new byte[(int) imageFile.length()];
		inputStream.read(imageBytes);
		inputStream.close();
		String base64Image = Base64.encodeBase64String(imageBytes);
		
		FilesDto dto = new FilesDto("abcd.jpg",base64Image);
		
		MessageDto messageDto = new MessageDto("0104","제목","내동생");
		
		MmsResponseDto mmsResponse = mmsService.sendSms(dto);
		SmsResponseDto response = smsService.sendSms(messageDto, mmsResponse);
		//SmsResultDto resResponse= resultService.sendSms(response.getRequestId());
		System.out.println(response);
			model.addAttribute("msg1", response.getStatusCode());
			model.addAttribute("msg2", response.getStatusName());
//		model.addAttribute("response", mmsResponse);
		model.addAttribute("response1", response);
		return "sendSms";
	}
	
	@GetMapping("send/sms")
	public String result(@RequestParam("requestId") String requestId, Model model) throws RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, IOException  {
		
		SmsResultDto resResponse= resultService.sendSms(requestId);
		
		//model.addAttribute("response2", resResponse);
		return "sendSms";
	}
	
//	@PostMapping(value="/sms/send")
//	public String sendSms(@RequestBody MessageDto messageDto, Model model) throws RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, IOException {
//		String upDir=System.getProperty("user.dir"); // 프로젝트 루트 디렉토리
//		upDir+="/src/main/resources/static/upload_images/gifticon/abcd.jpg";
//		String imagePath = upDir;
//		
//		File imageFile = new File(imagePath);
//    	FileInputStream inputStream = new FileInputStream(imageFile);
//    	byte[] imageBytes = new byte[(int) imageFile.length()];
//		inputStream.read(imageBytes);
//		inputStream.close();
//		String base64Image = Base64.encodeBase64String(imageBytes);
//		
//		FilesDto dto = new FilesDto("abcd.jpg",base64Image);
//		MmsResponseDto mmsResponse = mmsService.sendSms(dto);
////		SmsResponseDto response = smsService.sendSms(messageDto);
//		SmsResponseDto response = smsService.sendSms(messageDto, mmsResponse);
//		model.addAttribute("response", response);
//		return "sendSms";
//	}
 
	
}
