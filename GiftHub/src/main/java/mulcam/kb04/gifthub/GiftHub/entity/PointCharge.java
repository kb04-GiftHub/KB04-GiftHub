package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointCharge {
	private String merchantUid, impUid;
	private int chargeAmount;
	private Date chargeDate;
	private String customerId;

}