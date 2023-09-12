package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftDto {
	private int giftNo, giftStatus, buyNo;
	private String giftBarcode, customerId;
	private Date giftExp;

	public static GiftDto entityToDto(Gift entity) {
		
		return GiftDto.builder()
				.giftNo(entity.getGiftNo())
				.giftStatus(entity.getGiftStatus())
				.buyNo(entity.getBuyNo().getBuyNo())
				.giftBarcode(entity.getGiftBarcode())
				.customerId(entity.getCustomerId().getCustomerId())
				.giftExp(entity.getGiftExp())
				.build();
	}
}