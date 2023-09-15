package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.PointCharge;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointChargeDto {
	private String merchantUid, impUid;
	private int chargeAmount;
	private Date chargeDate;
	private String customerId;
	
	public static PointChargeDto entityToDto(PointCharge entity) {
		return PointChargeDto.builder()
				.merchantUid(entity.getMerchantUid())
				.impUid(entity.getImpUid())
				.chargeAmount(entity.getChargeAmount())
				.chargeDate(entity.getChargeDate())
				.customerId(entity.getCustomerId().getCustomerId())
				.build();
	}
}