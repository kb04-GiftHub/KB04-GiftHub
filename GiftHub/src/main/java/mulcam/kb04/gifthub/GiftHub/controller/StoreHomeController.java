package mulcam.kb04.gifthub.GiftHub.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StoreHomeController {
//	@GetMapping("/sale")
//	public String sale() {
//		return "list/sale";
//	}
	@GetMapping("/data")
	@ResponseBody
	public Map<String, Object> getData() {
		Map<String, Object> data = new HashMap<>();
		data.put("x", new int[] { 1, 2, 3, 4, 5 });
		data.put("y", new int[] { 5, 10, 15, 20, 25 });
		return data;
	}

	@GetMapping("/sale")
	public String chart() {
		return "sale";
	}

	@GetMapping("/calculate")
	public String calculate() {
		return "list/calculate";
	}
}
