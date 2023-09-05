package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Buy {
	private int buyNo, buyPrice, productNo;
	private Date buyDate;
	private String storeId, buyerId;

	public Buy() {
		// TODO Auto-generated constructor stub
	}

	public Buy(int buyNo, int buyPrice, int productNo, Date buyDate, String storeId, String buyerId) {
		super();
		this.buyNo = buyNo;
		this.buyPrice = buyPrice;
		this.productNo = productNo;
		this.buyDate = buyDate;
		this.storeId = storeId;
		this.buyerId = buyerId;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	@Override
	public String toString() {
		return "Buy [buyNo=" + buyNo + ", buyPrice=" + buyPrice + ", productNo=" + productNo + ", buyDate=" + buyDate
				+ ", storeId=" + storeId + ", buyerId=" + buyerId + "]";
	}

}
