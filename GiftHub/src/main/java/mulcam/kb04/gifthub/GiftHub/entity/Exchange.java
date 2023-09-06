package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

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
public class Exchange {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "EXCHANGE_SEQ")
	@SequenceGenerator(sequenceName = "EXCHANGE_SEQ", allocationSize = 1, name = "EXCHANGE_SEQ")
	private int exchangeNo;

	private String exchangeBank, exchangeAccount;

	private int exchangeMoney;

	private Date exchangeDate;

	@ManyToOne
	@JoinColumn(name = "storeId")
	private Store storeId;
}