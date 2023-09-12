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
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Gift {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GIFT_SEQ")
	@SequenceGenerator(sequenceName = "GIFT_SEQ", allocationSize = 1, name = "GIFT_SEQ")
	private int giftNo;		// 기프티콘 번호(pk)

	private int giftStatus; // 사용여부

	@OneToOne
	@JoinColumn(name = "buyNo")
	private Buy buyNo;		// 구매번호

	private String giftBarcode;	// 바코드

	@ManyToOne
	@JoinColumn(name = "customerId")	
	private Customer customerId;	// 사용자 ID

	private Date giftExp;	// 유효기간

	
	public static Gift dtoToEntity(GiftDto dto) {
		Customer customer = new Customer();		
		customer.setCustomerId(dto.getCustomerId());
		
		Buy buy = new Buy();		
		buy.setBuyNo(dto.getBuyNo());
		
		return Gift.builder()
				.giftNo(dto.getGiftNo())
				.giftStatus(dto.getGiftStatus())
				.buyNo(buy)
				.giftBarcode(dto.getGiftBarcode())
				.customerId(customer)
				.giftExp(dto.getGiftExp())
				.build();
	}
}