package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftUsed {
	private int usedNo, giftNo;
	private String usedId;
	private Date usedDate;

	public GiftUsed() {
		// TODO Auto-generated constructor stub
	}

	public GiftUsed(int usedNo, int giftNo, String usedId, Date usedDate) {
		super();
		this.usedNo = usedNo;
		this.giftNo = giftNo;
		this.usedId = usedId;
		this.usedDate = usedDate;
	}

	public int getUsedNo() {
		return usedNo;
	}

	public void setUsedNo(int usedNo) {
		this.usedNo = usedNo;
	}

	public int getGiftNo() {
		return giftNo;
	}

	public void setGiftNo(int giftNo) {
		this.giftNo = giftNo;
	}

	public String getUsedId() {
		return usedId;
	}

	public void setUsedId(String usedId) {
		this.usedId = usedId;
	}

	public Date getUsedDate() {
		return usedDate;
	}

	public void setUsedDate(Date usedDate) {
		this.usedDate = usedDate;
	}

	@Override
	public String toString() {
		return "GiftUsed [usedNo=" + usedNo + ", giftNo=" + giftNo + ", usedId=" + usedId + ", usedDate=" + usedDate
				+ "]";
	}

}
