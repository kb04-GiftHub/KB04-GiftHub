package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionDto {
	private String promotionTitle, promotionContent;
	private Store storeId;
	private int promotionNo;
	public int promotionType;
	private Date promotionDate;
	private String promotionImage; 
}