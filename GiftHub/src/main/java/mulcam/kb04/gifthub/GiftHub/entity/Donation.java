package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Donation {
	private int donationNo, donationAmount;
	private Date donationDate;
	private String customerId;
	private int orgNo;

	public Donation() {
		// TODO Auto-generated constructor stub
	}

	public Donation(int donationNo, int donationAmount, Date donationDate, String customerId, int orgNo) {
		super();
		this.donationNo = donationNo;
		this.donationAmount = donationAmount;
		this.donationDate = donationDate;
		this.customerId = customerId;
		this.orgNo = orgNo;
	}

	public int getDonationNo() {
		return donationNo;
	}

	public void setDonationNo(int donationNo) {
		this.donationNo = donationNo;
	}

	public int getDonationAmount() {
		return donationAmount;
	}

	public void setDonationAmount(int donationAmount) {
		this.donationAmount = donationAmount;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public int getOrgNo() {
		return orgNo;
	}

	public void setOrgNo(int orgNo) {
		this.orgNo = orgNo;
	}

	@Override
	public String toString() {
		return "Donation [donationNo=" + donationNo + ", donationAmount=" + donationAmount + ", donationDate="
				+ donationDate + ", customerId=" + customerId + ", orgNo=" + orgNo + "]";
	}

}
