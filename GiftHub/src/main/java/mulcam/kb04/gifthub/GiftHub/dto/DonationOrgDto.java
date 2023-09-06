package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationOrgDto {
	private int orgNo;
	private String orgName, orgMemo, orgAccount, orgBank;
	private int orgStatus;
}
