package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class DonationOrg {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "DONATION_ORG_SEQ")
	@SequenceGenerator(sequenceName = "DONATION_ORG_SEQ", allocationSize = 1, name = "DONATION_ORG_SEQ")
	private int orgNo;

	private String orgName, orgMemo, orgAccount, orgBank;

	private int orgStatus;
	

    @OneToMany(mappedBy = "donationOrg")
    private List<Donation> donations;
}
