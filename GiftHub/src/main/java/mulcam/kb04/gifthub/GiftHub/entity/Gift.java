package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gift {
	private int giftNo, giftStatus, buyNo;
	private String giftBarcode, customerId;
	private Date giftExp;

}