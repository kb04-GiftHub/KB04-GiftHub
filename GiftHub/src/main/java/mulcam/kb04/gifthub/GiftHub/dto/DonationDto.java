package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationDto {
	private int donationNo, donationAmount;
	private Date donationDate;
	private String customerId;
	private int orgNo;
}
