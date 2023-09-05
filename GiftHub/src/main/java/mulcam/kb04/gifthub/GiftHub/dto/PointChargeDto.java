package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointChargeDto {
	private String merchantUid, impUid;
	private int chargeAmount;
	private Date chargeDate;
	private String customerId;
}