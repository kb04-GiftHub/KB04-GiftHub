package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
	private String promotionTitle, promotionContent, storeId;
	private int promotionNo, promotionType;
	private Date promotionDate;

	public Promotion() {
		// TODO Auto-generated constructor stub
	}

	public Promotion(String promotionTitle, String promotionContent, String storeId, int promotionNo, int promotionType,
			Date promotionDate) {
		super();
		this.promotionTitle = promotionTitle;
		this.promotionContent = promotionContent;
		this.storeId = storeId;
		this.promotionNo = promotionNo;
		this.promotionType = promotionType;
		this.promotionDate = promotionDate;
	}

	public String getPromotionTitle() {
		return promotionTitle;
	}

	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}

	public String getPromotionContent() {
		return promotionContent;
	}

	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public int getPromotionNo() {
		return promotionNo;
	}

	public void setPromotionNo(int promotionNo) {
		this.promotionNo = promotionNo;
	}

	public int getPromotionType() {
		return promotionType;
	}

	public void setPromotionType(int promotionType) {
		this.promotionType = promotionType;
	}

	public Date getPromotionDate() {
		return promotionDate;
	}

	public void setPromotionDate(Date promotionDate) {
		this.promotionDate = promotionDate;
	}

	@Override
	public String toString() {
		return "Promotion [promotionTitle=" + promotionTitle + ", promotionContent=" + promotionContent + ", storeId="
				+ storeId + ", promotionNo=" + promotionNo + ", promotionType=" + promotionType + ", promotionDate="
				+ promotionDate + "]";
	}
}