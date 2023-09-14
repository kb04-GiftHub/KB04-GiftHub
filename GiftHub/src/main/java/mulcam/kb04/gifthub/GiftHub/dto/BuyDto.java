package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Buy;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BuyDto {
	private int buyNo, buyPrice, productNo;
	private Date buyDate;
	private String storeId, buyerId;
	
	
	public static BuyDto entityToDto(Buy entity) {
		return BuyDto.builder()
				.buyNo(entity.getBuyNo())
				.buyPrice(entity.getBuyPrice())
				.productNo(entity.getProductNo().getProductNo())
				.buyDate(entity.getBuyDate())
				.storeId(entity.getStoreId().getStoreId())
				.buyerId(entity.getBuyerId().getCustomerId())
				.build();
	}
	
}
