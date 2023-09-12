package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.GiftUsedDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class GiftUsed {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GIFT_USED_SEQ")
	@SequenceGenerator(sequenceName = "GIFT_USED_SEQ", allocationSize = 1, name = "GIFT_USED_SEQ")
	private int usedNo;

	@OneToOne
	@JoinColumn(name = "giftNo")
	private Gift giftNo;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;

	
	private Date usedDate;
	
	public static GiftUsed dtoToEntity(GiftUsedDto dto) {
		Gift gift = new Gift();
		gift.setGiftNo(dto.getGiftNo());
		
		Customer customer = new Customer();
		customer.setCustomerId(dto.getCustomerId());
		
		return GiftUsed.builder()
                .usedNo(dto.getUsedNo())
                .giftNo(gift) // Gift 엔티티를 빌더로 생성
                .customerId(customer) // Customer 엔티티를 빌더로 생성
                .usedDate(dto.getUsedDate())
                .build();
    }
	
}
