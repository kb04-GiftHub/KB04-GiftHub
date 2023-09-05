package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {
	private String storeId, storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private int storeStatus, categoryNo;

	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(String storeId, String storePwd, String storeName, String storeEmail, String storeTel,
			String storeAdd1, String storeAdd2, String storeAdd3, int storeStatus, int categoryNo) {
		super();
		this.storeId = storeId;
		this.storePwd = storePwd;
		this.storeName = storeName;
		this.storeEmail = storeEmail;
		this.storeTel = storeTel;
		this.storeAdd1 = storeAdd1;
		this.storeAdd2 = storeAdd2;
		this.storeAdd3 = storeAdd3;
		this.storeStatus = storeStatus;
		this.categoryNo = categoryNo;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getStorePwd() {
		return storePwd;
	}

	public void setStorePwd(String storePwd) {
		this.storePwd = storePwd;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreEmail() {
		return storeEmail;
	}

	public void setStoreEmail(String storeEmail) {
		this.storeEmail = storeEmail;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStoreAdd1() {
		return storeAdd1;
	}

	public void setStoreAdd1(String storeAdd1) {
		this.storeAdd1 = storeAdd1;
	}

	public String getStoreAdd2() {
		return storeAdd2;
	}

	public void setStoreAdd2(String storeAdd2) {
		this.storeAdd2 = storeAdd2;
	}

	public String getStoreAdd3() {
		return storeAdd3;
	}

	public void setStoreAdd3(String storeAdd3) {
		this.storeAdd3 = storeAdd3;
	}

	public int getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(int storeStatus) {
		this.storeStatus = storeStatus;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storePwd=" + storePwd + ", storeName=" + storeName + ", storeEmail="
				+ storeEmail + ", storeTel=" + storeTel + ", storeAdd1=" + storeAdd1 + ", storeAdd2=" + storeAdd2
				+ ", storeAdd3=" + storeAdd3 + ", storeStatus=" + storeStatus + ", categoryNo=" + categoryNo + "]";
	}

}