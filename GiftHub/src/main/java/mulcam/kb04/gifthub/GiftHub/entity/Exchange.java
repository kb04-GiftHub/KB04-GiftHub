package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exchange {
	private int exchangeNo;
	private String exchangeBank, exchangeAccount;
	private int exchangeMoney;
	private Date exchangeDate;
	private String storeId;
	public Exchange() {
		// TODO Auto-generated constructor stub
	}
	public Exchange(int exchangeNo, String exchangeBank, String exchangeAccount, int exchangeMoney, Date exchangeDate,
			String storeId) {
		super();
		this.exchangeNo = exchangeNo;
		this.exchangeBank = exchangeBank;
		this.exchangeAccount = exchangeAccount;
		this.exchangeMoney = exchangeMoney;
		this.exchangeDate = exchangeDate;
		this.storeId = storeId;
	}
	public int getExchangeNo() {
		return exchangeNo;
	}
	public void setExchangeNo(int exchangeNo) {
		this.exchangeNo = exchangeNo;
	}
	public String getExchangeBank() {
		return exchangeBank;
	}
	public void setExchangeBank(String exchangeBank) {
		this.exchangeBank = exchangeBank;
	}
	public String getExchangeAccount() {
		return exchangeAccount;
	}
	public void setExchangeAccount(String exchangeAccount) {
		this.exchangeAccount = exchangeAccount;
	}
	public int getExchangeMoney() {
		return exchangeMoney;
	}
	public void setExchangeMoney(int exchangeMoney) {
		this.exchangeMoney = exchangeMoney;
	}
	public Date getExchangeDate() {
		return exchangeDate;
	}
	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	@Override
	public String toString() {
		return "Exchange [exchangeNo=" + exchangeNo + ", exchangeBank=" + exchangeBank + ", exchangeAccount="
				+ exchangeAccount + ", exchangeMoney=" + exchangeMoney + ", exchangeDate=" + exchangeDate + ", storeId="
				+ storeId + "]";
	}
}