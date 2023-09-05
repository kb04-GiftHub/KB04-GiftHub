package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
	private String customerID, customerPwd, customerEmail, customerGender, customerBirth, customerName, customerTel,
			customerAdd1, customerAdd2, customerAdd3, customerNickname;
	private int point, customerStatus;

	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(String customerID, String customerPwd, String customerEmail, String customerGender,
			String customerBirth, String customerName, String customerTel, String customerAdd1, String customerAdd2,
			String customerAdd3, String customerNickname, int point, int customerStatus) {
		super();
		this.customerID = customerID;
		this.customerPwd = customerPwd;
		this.customerEmail = customerEmail;
		this.customerGender = customerGender;
		this.customerBirth = customerBirth;
		this.customerName = customerName;
		this.customerTel = customerTel;
		this.customerAdd1 = customerAdd1;
		this.customerAdd2 = customerAdd2;
		this.customerAdd3 = customerAdd3;
		this.customerNickname = customerNickname;
		this.point = point;
		this.customerStatus = customerStatus;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerPwd() {
		return customerPwd;
	}

	public void setCustomerPwd(String customerPwd) {
		this.customerPwd = customerPwd;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerGender() {
		return customerGender;
	}

	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}

	public String getCustomerBirth() {
		return customerBirth;
	}

	public void setCustomerBirth(String customerBirth) {
		this.customerBirth = customerBirth;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerTel() {
		return customerTel;
	}

	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

	public String getCustomerAdd1() {
		return customerAdd1;
	}

	public void setCustomerAdd1(String customerAdd1) {
		this.customerAdd1 = customerAdd1;
	}

	public String getCustomerAdd2() {
		return customerAdd2;
	}

	public void setCustomerAdd2(String customerAdd2) {
		this.customerAdd2 = customerAdd2;
	}

	public String getCustomerAdd3() {
		return customerAdd3;
	}

	public void setCustomerAdd3(String customerAdd3) {
		this.customerAdd3 = customerAdd3;
	}

	public String getCustomerNickname() {
		return customerNickname;
	}

	public void setCustomerNickname(String customerNickname) {
		this.customerNickname = customerNickname;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCustomerStatus() {
		return customerStatus;
	}

	public void setCustomerStatus(int customerStatus) {
		this.customerStatus = customerStatus;
	}

	@Override
	public String toString() {
		return "Customer [customerID=" + customerID + ", customerPwd=" + customerPwd + ", customerEmail="
				+ customerEmail + ", customerGender=" + customerGender + ", customerBirth=" + customerBirth
				+ ", customerName=" + customerName + ", customerTel=" + customerTel + ", customerAdd1=" + customerAdd1
				+ ", customerAdd2=" + customerAdd2 + ", customerAdd3=" + customerAdd3 + ", customerNickname="
				+ customerNickname + ", point=" + point + ", customerStatus=" + customerStatus + "]";
	}

}
