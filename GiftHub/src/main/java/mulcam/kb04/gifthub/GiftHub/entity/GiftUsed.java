package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftUsed {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "GIFT_USED_SEQ")
	@SequenceGenerator(sequenceName = "GIFT_USED_SEQ", allocationSize = 1, name = "GIFT_USED_SEQ")
	private int usedNo;

	@JoinColumn(name = "giftNo")
	private Gift giftNo;

	private String usedId;

	private Date usedDate;

}
