package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Exchange;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExchangeDto {
	private int exchangeNo;
	private String storeName;
	private String exchangeBank;
	private String exchangeAccount;
	private int exchangeMoney;
	private Date exchangeDate;
	private String storeId;
	private Store store;

	public ExchangeDto(int exchangeNo, String storeName, String exchangeBank, String exchangeAccount, int exchangeMoney,
			Date exchangeDate, Store store) {
		this.exchangeNo = exchangeNo;
		this.storeName = storeName;
		this.exchangeBank = exchangeBank;
		this.exchangeAccount = exchangeAccount;
		this.exchangeMoney = exchangeMoney;
		this.exchangeDate = exchangeDate;
		this.store = store;
	}
	
	public static ExchangeDto entityToDto(Exchange entity) {
		return ExchangeDto.builder()
				.exchangeNo(entity.getExchangeNo())
				.exchangeBank(entity.getExchangeBank())
				.exchangeAccount(entity.getExchangeAccount())
				.exchangeMoney(entity.getExchangeMoney())
				.exchangeDate(entity.getExchangeDate())
				.storeId(entity.getStoreId().getStoreId())
				.build();
	}
}