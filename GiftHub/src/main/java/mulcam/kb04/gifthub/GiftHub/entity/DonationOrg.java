package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonationOrg {
	private int orgNo;
	private String orgName, orgMemo, orgAccount, orgBank;
	private int orgStatus;

	public DonationOrg() {
		// TODO Auto-generated constructor stub
	}

	public DonationOrg(int orgNo, String orgName, String orgMemo, String orgAccount, String orgBank, int orgStatus) {
		super();
		this.orgNo = orgNo;
		this.orgName = orgName;
		this.orgMemo = orgMemo;
		this.orgAccount = orgAccount;
		this.orgBank = orgBank;
		this.orgStatus = orgStatus;
	}

	public int getOrgNo() {
		return orgNo;
	}

	public void setOrgNo(int orgNo) {
		this.orgNo = orgNo;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgMemo() {
		return orgMemo;
	}

	public void setOrgMemo(String orgMemo) {
		this.orgMemo = orgMemo;
	}

	public String getOrgAccount() {
		return orgAccount;
	}

	public void setOrgAccount(String orgAccount) {
		this.orgAccount = orgAccount;
	}

	public String getOrgBank() {
		return orgBank;
	}

	public void setOrgBank(String orgBank) {
		this.orgBank = orgBank;
	}

	public int getOrgStatus() {
		return orgStatus;
	}

	public void setOrgStatus(int orgStatus) {
		this.orgStatus = orgStatus;
	}

	@Override
	public String toString() {
		return "DonationOrg [orgNo=" + orgNo + ", orgName=" + orgName + ", orgMemo=" + orgMemo + ", orgAccount="
				+ orgAccount + ", orgBank=" + orgBank + ", orgStatus=" + orgStatus + "]";
	}

}
