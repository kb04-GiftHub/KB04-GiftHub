package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.DonationDto;
import mulcam.kb04.gifthub.GiftHub.dto.DonationOrgDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class DonationOrg {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "DONATION_ORG_SEQ")
	@SequenceGenerator(sequenceName = "DONATION_ORG_SEQ", allocationSize = 1, name = "DONATION_ORG_SEQ")
	private int orgNo;

	private String orgName, orgMemo;

	private int orgTotal;

    @OneToMany(mappedBy = "donationOrg")
    private List<Donation> donations;
    
	public static DonationOrg dtoToEntity(DonationOrgDto dto) {
		return DonationOrg.builder()
				.orgNo(dto.getOrgNo())
				.orgName(dto.getOrgName())
				.orgMemo(dto.getOrgMemo())
				.orgTotal(dto.getOrgTotal())
				.build();
	}
}
