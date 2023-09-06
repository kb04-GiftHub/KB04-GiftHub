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
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Gift {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GIFT_SEQ")
	@SequenceGenerator(sequenceName = "GIFT_SEQ", allocationSize = 1, name = "GIFT_SEQ")
	private int giftNo;

	private int giftStatus;

	@OneToOne
	@JoinColumn(name = "buyNo")
	private Buy buyNo;

	private String giftBarcode;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;

	private Date giftExp;

}