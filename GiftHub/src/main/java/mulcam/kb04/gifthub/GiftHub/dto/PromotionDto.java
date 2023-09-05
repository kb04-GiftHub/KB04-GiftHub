package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionDto {
	private String promotionTitle, promotionContent, storeId;
	private int promotionNo,promotionType;
	private Date promotionDate;
}