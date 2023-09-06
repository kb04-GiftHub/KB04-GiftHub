package mulcam.kb04.gifthub.GiftHub.entity;

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
public class Jjim {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "JJIM_SEQ")
	@SequenceGenerator(sequenceName = "JJIM_SEQ", allocationSize = 1, name = "JJIM_SEQ")
	private int jjimNo;

	@ManyToOne
	@JoinColumn(name = "productNo")
	private Product productNo;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;

}
