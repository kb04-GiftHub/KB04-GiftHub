package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationOrg {
	private int orgNo;
	private String orgName, orgMemo, orgAccount, orgBank;
	private int orgStatus;

}
