package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
