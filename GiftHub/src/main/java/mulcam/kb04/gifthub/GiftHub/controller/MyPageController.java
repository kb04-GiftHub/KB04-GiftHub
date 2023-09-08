package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;

	@GetMapping("/mypage/check_pwd")
	public String check_pwd() {
		return "mypage/check_pwd";
	}
	
	@PostMapping("/mypage/check_action")
	public String check_action(@RequestParam String password,
			Model model, RedirectAttributes redirect, HttpSession session) {
		String loggedId = (String)session.getAttribute("loggedId");
		StoreDto storeDto = myPageService.findByStoreId(loggedId);
		if(storeDto.getStorePwd().equals(password)) {
			model.addAttribute("storeDto", storeDto);
			return "mypage/my_info";
		}
		
		redirect.addFlashAttribute("msg", " ✖️ 비밀번호가 일치하지 않습니다.");
		return "redirect:/mypage/check_pwd";
	}
	
	@PostMapping("/mypage/update_action")
	public String update_action(@RequestParam("name") String name,
			@RequestParam("username") String id, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("address1") String add1,
			@RequestParam("address2") String add2, @RequestParam("address3") String add3,
			@RequestParam("category") int cate) {
		
		StoreDto storeDto = myPageService.findByStoreId(id);

		storeDto.setStoreName(name);
		storeDto.setStoreTel(phone);
		storeDto.setStoreEmail(email);
		storeDto.setStoreAdd1(add1);
		storeDto.setStoreAdd2(add2);
		storeDto.setStoreAdd3(add3);
		storeDto.setCategoryNo(cate);
		
		myPageService.save(storeDto);
		
		return "mypage/update_complete";
	}
	
	
}
