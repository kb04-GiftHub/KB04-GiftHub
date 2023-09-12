package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
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

	private int point;

	private int customerStatus;
	
	public static Customer dtoToEntity(CustomerDto dto) {
		return Customer.builder()
				.customerId(dto.getCustomerId())
				.customerPwd(dto.getCustomerPwd())
				.customerEmail(dto.getCustomerEmail())
				.customerGender(dto.getCustomerGender())
				.customerBirth(dto.getCustomerBirth())
				.customerName(dto.getCustomerName())
				.customerTel(dto.getCustomerTel())
				.customerAdd1(dto.getCustomerAdd1())
				.customerAdd2(dto.getCustomerAdd2())
				.customerAdd3(dto.getCustomerAdd3())
				.customerNickname(dto.getCustomerNickname())
				.point(dto.getPoint())
				.customerStatus(dto.getCustomerStatus())
				.build();
	}

}
