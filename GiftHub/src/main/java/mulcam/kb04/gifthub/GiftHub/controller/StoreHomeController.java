package mulcam.kb04.gifthub.GiftHub.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Controller
public class StoreHomeController {
	@Autowired
	private GiftUsedService giftUsedService;

	@GetMapping("/calculate")
	public String calculate() {
		return "list/calculate";
	}
}
