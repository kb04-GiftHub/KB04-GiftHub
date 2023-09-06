package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Column;
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
public class Buy {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BUY_SEQ")
	@SequenceGenerator(sequenceName = "BUY_SEQ", allocationSize = 1, name = "BUY_SEQ")
	private int buyNo;

	private int buyPrice;

	@ManyToOne
	@JoinColumn(name = "productNo")
	private Product productNo;

	private Date buyDate;
	
	@OneToOne
	@JoinColumn(name = "storeId")
	private Store storeId;

	@OneToOne
	@JoinColumn(name = "buyerId", referencedColumnName = "customerId")
	private Customer buyerId;
}
