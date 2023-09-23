package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.DonationOrg;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DonationOrgDto {
	private int orgNo;
	private String orgName, orgMemo;
	private int orgTotal;
	
	public static DonationOrgDto entityToDto(DonationOrg entity) {
		return DonationOrgDto.builder()
				.orgNo(entity.getOrgNo())
				.orgName(entity.getOrgName())
				.orgMemo(entity.getOrgMemo())
				.orgTotal(entity.getOrgTotal())
				.build();
	}
}
