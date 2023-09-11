package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.GiftUsed;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftUsedDto {
	private int usedNo, giftNo;
	private String customerId;
	private Date usedDate;
	
	public static GiftUsedDto entityToDto(GiftUsed entity) {
        return GiftUsedDto.builder()
                .usedNo(entity.getUsedNo())
                .giftNo(entity.getGiftNo().getGiftNo()) // Gift 엔티티의 giftNo 필드를 가져옴
                .customerId(entity.getCustomerId().getCustomerId()) // Customer 엔티티의 customerId 필드를 가져옴
                .usedDate(entity.getUsedDate())
                .build();
    }
	
}
