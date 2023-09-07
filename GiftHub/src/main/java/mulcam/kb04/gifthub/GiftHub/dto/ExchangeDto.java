package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExchangeDto {
	private int exchangeNo;
	private String exchangeBank, exchangeAccount;
	private int exchangeMoney;
	private Date exchangeDate;
	private String storeId;
}