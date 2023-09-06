package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Donation {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "DONATION_SEQ")
	@SequenceGenerator(sequenceName = "DONATAION_SEQ", allocationSize = 1, name = "DONTAION_SEQ")
	private int donationNo;

	private int donationAmount;

	private Date donationDate;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;

	@ManyToOne
	@JoinColumn(name = "orgNo")
	private DonationOrg orgNo;
}
