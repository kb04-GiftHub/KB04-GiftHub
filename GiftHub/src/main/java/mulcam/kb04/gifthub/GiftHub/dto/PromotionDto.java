package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Promotion;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PromotionDto {
	private String promotionTitle, promotionContent;
	private String storeId;
	private int promotionNo;
	private int promotionType;
	private Date promotionDate;
	private String promotionImage;

	public static PromotionDto entityToDto(Promotion promo) {
		return PromotionDto.builder()
				.promotionTitle(promo.getPromotionTitle())
				.promotionContent(promo.getPromotionContent())
				.storeId(promo.getStoreId().getStoreId())
				.promotionNo(promo.getPromotionNo())
				.promotionType(promo.getPromotionType())
				.promotionDate(promo.getPromotionDate())
				.promotionImage(promo.getPromotionImage())
				.build();
	}
}