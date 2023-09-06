package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftDto {
	private int giftNo, giftStatus, buyNo;
	private String giftBarcode, customerId;
	private Date giftExp;

}