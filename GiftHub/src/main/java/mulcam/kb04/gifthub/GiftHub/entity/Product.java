package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int productNo, productPrice;
	private String productName, productMemo, productImage, storeId;
	private Date productExp;

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productNo, int productPrice, String productName, String productMemo, String productImage,
			String storeId, Date productExp) {
		super();
		this.productNo = productNo;
		this.productPrice = productPrice;
		this.productName = productName;
		this.productMemo = productMemo;
		this.productImage = productImage;
		this.storeId = storeId;
		this.productExp = productExp;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductMemo() {
		return productMemo;
	}

	public void setProductMemo(String productMemo) {
		this.productMemo = productMemo;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public Date getProductExp() {
		return productExp;
	}

	public void setProductExp(Date productExp) {
		this.productExp = productExp;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productPrice=" + productPrice + ", productName=" + productName
				+ ", productMemo=" + productMemo + ", productImage=" + productImage + ", storeId=" + storeId
				+ ", productExp=" + productExp + "]";
	}

}
