package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gift {
	private int giftNo, giftStatus, buyNo;
	private String giftBarcode, customerId;
	private Date giftExp;

	public Gift() {
		// TODO Auto-generated constructor stub
	}

	public Gift(int giftNo, int giftStatus, int buyNo, String giftBarcode, String customerId, Date giftExp) {
		super();
		this.giftNo = giftNo;
		this.giftStatus = giftStatus;
		this.buyNo = buyNo;
		this.giftBarcode = giftBarcode;
		this.customerId = customerId;
		this.giftExp = giftExp;
	}

	public int getGiftNo() {
		return giftNo;
	}

	public void setGiftNo(int giftNo) {
		this.giftNo = giftNo;
	}

	public int getGiftStatus() {
		return giftStatus;
	}

	public void setGiftStatus(int giftStatus) {
		this.giftStatus = giftStatus;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public String getGiftBarcode() {
		return giftBarcode;
	}

	public void setGiftBarcode(String giftBarcode) {
		this.giftBarcode = giftBarcode;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Date getGiftExp() {
		return giftExp;
	}

	public void setGiftExp(Date giftExp) {
		this.giftExp = giftExp;
	}

	@Override
	public String toString() {
		return "Gift [giftNo=" + giftNo + ", giftStatus=" + giftStatus + ", buyNo=" + buyNo + ", giftBarcode="
				+ giftBarcode + ", customerId=" + customerId + ", giftExp=" + giftExp + "]";
	}

}