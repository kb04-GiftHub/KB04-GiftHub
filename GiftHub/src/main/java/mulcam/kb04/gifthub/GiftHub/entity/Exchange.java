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
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.ExchangeDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Exchange {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "EXCHANGE_SEQ")
	@SequenceGenerator(sequenceName = "EXCHANGE_SEQ", allocationSize = 1, name = "EXCHANGE_SEQ")
	private int exchangeNo;

	private String exchangeBank;

	private String exchangeAccount;

	private int exchangeMoney;

	private Date exchangeDate;

	@ManyToOne
	@JoinColumn(name = "storeId")
	private Store storeId;
	
	public static Exchange dtoToEntity(ExchangeDto dto) {
		Store store = new Store();
		store.setStoreId(dto.getStoreId());

		return Exchange.builder()
				.exchangeNo(dto.getExchangeNo())
				.exchangeBank(dto.getExchangeBank())
				.exchangeAccount(dto.getExchangeAccount())
				.exchangeMoney(dto.getExchangeMoney())
				.exchangeDate(dto.getExchangeDate())
				.storeId(store)
				.build();
	}
}