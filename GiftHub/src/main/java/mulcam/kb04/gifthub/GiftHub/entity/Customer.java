package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
	@Id
	private String customerId;

	private String customerPwd;

	private String customerEmail;

	private String customerGender;

	private String customerBirth;

	private String customerName;

	private String customerTel;

	private String customerAdd1;

	private String customerAdd2;

	private String customerAdd3;

	private String customerNickname;

	private int customerPoint;

	private int customerStatus;

}
