package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Donation;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationDto {
	private int donationNo, donationAmount;
	private Date donationDate;
	private String customerId;
	private int orgNo;
	
	public static DonationDto entityToDto(Donation entity) {
		return DonationDto.builder()
				.donationNo(entity.getDonationNo())
				.donationAmount(entity.getDonationAmount())
				.donationDate(entity.getDonationDate())
				.customerId(entity.getCustomerId().getCustomerId())
				.orgNo(entity.getDonationOrg().getOrgNo())
				.build();
	}
}
