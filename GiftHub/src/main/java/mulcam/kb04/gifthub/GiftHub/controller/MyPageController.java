package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;

@Controller
public class MyPageController {
	
	@Autowired
	private StoreRepository repository;

	@GetMapping("/mypage/check_pwd")
	public String check_pwd() {
		return "mypage/check_pwd";
	}
	
	@PostMapping("/mypage/check_action")
	public String check_action(@RequestParam String pwd, @RequestParam String pwd_chk, Model model) {
		Store store = repository.findByStoreId("store");
		if(pwd.equals(pwd_chk)) {
			if(store.getStorePwd().equals(pwd)) {
				model.addAttribute("msg", "본인인증 성공");
				return "mypage/update_info";
			}
		} else {
			model.addAttribute("msg", "비밀번호 불일치");
			return "mypage/update_info";
		}
		
		
		model.addAttribute("msg", "본인인증 실패");
		return "mypage/update_info";
	}
	
}
