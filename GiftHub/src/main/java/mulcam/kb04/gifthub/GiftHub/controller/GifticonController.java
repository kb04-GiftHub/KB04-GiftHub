package mulcam.kb04.gifthub.GiftHub.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


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
	public String gifticon_use_action(@RequestParam("image") MultipartFile file, HttpSession ses, Model m) {
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
		return "redirect:/gifticon/use";
	}
}
