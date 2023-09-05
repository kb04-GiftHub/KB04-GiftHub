package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jjim {
	private int jjimNo, productNo;
	private String customerId;
	public Jjim() {
		// TODO Auto-generated constructor stub
	}
	public Jjim(int jjimNo, int productNo, String customerId) {
		super();
		this.jjimNo = jjimNo;
		this.productNo = productNo;
		this.customerId = customerId;
	}
	public int getJjimNo() {
		return jjimNo;
	}
	public void setJjimNo(int jjimNo) {
		this.jjimNo = jjimNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	@Override
	public String toString() {
		return "Jjim [jjimNo=" + jjimNo + ", productNo=" + productNo + ", customerId=" + customerId + "]";
	}
	

}
