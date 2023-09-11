package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.List;

import lombok.Data;

@Data
public class KakaoMapResponseDTO {
	private List<KakaoMapAddressDTO> documents;

	@Data
	public static class KakaoMapAddressDTO {
		private String address_name;
		private String x; // longitude
		private String y; // latitude
	}

}
