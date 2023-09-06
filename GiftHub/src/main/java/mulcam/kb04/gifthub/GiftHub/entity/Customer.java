package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="CUSTOMER")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CUSTOMER_SEQ")
    @SequenceGenerator(sequenceName = "CUSTOMER_SEQ", allocationSize = 1, name = "CUSTOMER_SEQ")
	@Column(name="customerId")
	private String customerId;
	
	@Column(name="customerPwd")
	private String customerPwd;
	
	@Column(name="customerEmail")
	private String customerEmail;
	
	@Column(name="customerGender")
	private String customerGender;
	
	@Column(name="customerBirth")
	private String customerBirth;
	
	@Column(name="customerName")
	private String customerName;
	
	@Column(name="customerTel")
	private String customerTel;
	
	@Column(name="customerAdd1")
	private String customerAdd1; 
	
	@Column(name="customerAdd2")
	private String customerAdd2;
	
	@Column(name="customerAdd3")
	private String customerAdd3;
	
	@Column(name="customerNickname")
	private String customerNickname;
	
	@Column(name="customerPoint")
	private int customerPoint;
	
	@Column(name="customerStatus")
	private int customerStatus;


}
