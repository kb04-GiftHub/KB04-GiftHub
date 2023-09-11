package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Data
@NoArgsConstructor
@AllArgsConstructor
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
}