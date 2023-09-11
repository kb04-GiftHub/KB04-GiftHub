package mulcam.kb04.gifthub.GiftHub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {
	
	@GetMapping("/member/main")
	public String member_main(HttpSession ses, Model model) {
		
		String memberId = (String) ses.getAttribute("loggedMemberId");
		// memberId를 사용하여 GIFT 테이블에서 해당 회원의 기프티콘 정보를 가져옵니다.
        // 이 부분은 데이터베이스 연동 및 서비스 계층에서 처리되어야 합니다.

        // 모델에 기프티콘 정보를 추가하여 JSP에서 사용할 수 있도록 합니다.
		
		//model.addAttribute("giftList", giftList);
		
		return "member/main";
	}
	
}
