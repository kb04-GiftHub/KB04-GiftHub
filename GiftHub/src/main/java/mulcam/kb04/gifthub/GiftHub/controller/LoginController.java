package mulcam.kb04.gifthub.GiftHub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/register")
	public String register() {
		return "login/register";
	}
	
	@PostMapping("/register_action")
	public String register_action(@RequestParam("name") String name,
			@RequestParam("username") String id, @RequestParam("password") String pwd,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address1") String add1, @RequestParam("address2") String add2,
			@RequestParam("address3") String add3, @RequestParam("category") int cate,
			@RequestParam("status") int status) {
		
		StoreDto storeDto = new StoreDto();

		storeDto.setStoreId(id);
		storeDto.setStorePwd(pwd);
		storeDto.setStoreName(name);
		storeDto.setStoreTel(phone);
		storeDto.setStoreEmail(email);
		storeDto.setStoreAdd1(add1);
		storeDto.setStoreAdd2(add2);
		storeDto.setStoreAdd3(add3);
		storeDto.setCategoryNo(cate);
		storeDto.setStoreStatus(status);
		
		loginService.save(storeDto);
		System.out.println("등록완료");
		
		return "login/register";
	}
	
}
