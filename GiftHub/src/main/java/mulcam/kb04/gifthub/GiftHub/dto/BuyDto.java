package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyDto {
	private int buyNo, buyPrice, productNo;
	private Date buyDate;
	private String storeId, buyerId;
	

}
