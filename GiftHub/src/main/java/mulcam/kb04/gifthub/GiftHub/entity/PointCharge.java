package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointCharge {
	
	@Id
	private String merchantUid;
	
	private String impUid;
	private int chargeAmount;
	private Date chargeDate;
	
	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;
	
	public static PointCharge dtoToEntity(PointChargeDto dto) {
		Customer customer = new Customer();
		customer.setCustomerId(dto.getCustomerId());

		return PointCharge.builder()
				.merchantUid(dto.getMerchantUid())
				.impUid(dto.getImpUid())
				.chargeAmount(dto.getChargeAmount())
				.chargeDate(dto.getChargeDate())
				.customerId(customer)
				.build();
	}

}