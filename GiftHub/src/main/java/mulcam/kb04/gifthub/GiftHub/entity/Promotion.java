package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor 
@Builder
public class Promotion {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROMOTION_SEQ")
    @SequenceGenerator(sequenceName = "PROMOTION_SEQ", allocationSize = 1, name = "PROMOTION_SEQ")
	private int promotionNo;
	private String promotionTitle, promotionContent;
    private Date promotionDate; // SYSDATE를 디폴트값으로 설정
	private int promotionType;
	private String promotionImage;
	@ManyToOne
	@JoinColumn(name = "storeId")
	private Store storeId;
	
	public static Promotion dtoToEntity(PromotionDto promo) {
		
		Store store = new Store();
		store.setStoreId(promo.getStoreId());
		
		return Promotion.builder()
		.promotionTitle(promo.getPromotionTitle())
		.promotionContent(promo.getPromotionContent())
		.storeId(store)
		.promotionNo(promo.getPromotionNo())
		.promotionType(promo.getPromotionType())
		.promotionDate(new Date())
		.promotionImage(promo.getPromotionImage())
		.build();
	}
}