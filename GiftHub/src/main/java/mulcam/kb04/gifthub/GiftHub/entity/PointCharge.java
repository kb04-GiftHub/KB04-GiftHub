package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointCharge {
	private String merchantUid, impUid;
	private int chargeAmount;
	private Date chargeDate;
	private String customerId;

	public PointCharge() {
		// TODO Auto-generated constructor stub
	}

	public PointCharge(String merchantUid, String impUid, int chargeAmount, Date chargeDate, String customerId) {
		super();
		this.merchantUid = merchantUid;
		this.impUid = impUid;
		this.chargeAmount = chargeAmount;
		this.chargeDate = chargeDate;
		this.customerId = customerId;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getChargeAmount() {
		return chargeAmount;
	}

	public void setChargeAmount(int chargeAmount) {
		this.chargeAmount = chargeAmount;
	}

	public Date getChargeDate() {
		return chargeDate;
	}

	public void setChargeDate(Date chargeDate) {
		this.chargeDate = chargeDate;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "PointCharge [merchantUid=" + merchantUid + ", impUid=" + impUid + ", chargeAmount=" + chargeAmount
				+ ", chargeDate=" + chargeDate + ", customerId=" + customerId + "]";
	}

}