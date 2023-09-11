package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Customer;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerDto {
	private String customerId,customerPwd, customerEmail,customerGender,customerBirth, customerName, customerTel, customerAdd1, customerAdd2, customerAdd3, customerNickname;
	private int point,customerStatus;

	public static CustomerDto entityToDto(Customer entity) {
		return CustomerDto.builder()
				.customerId(entity.getCustomerId())
				.customerPwd(entity.getCustomerPwd())
				.customerEmail(entity.getCustomerEmail())
				.customerGender(entity.getCustomerGender())
				.customerBirth(entity.getCustomerBirth())
				.customerName(entity.getCustomerName())
				.customerTel(entity.getCustomerTel())
				.customerAdd1(entity.getCustomerAdd1())
				.customerAdd2(entity.getCustomerAdd2())
				.customerAdd3(entity.getCustomerAdd3())
				.customerNickname(entity.getCustomerNickname())
				.point(entity.getPoint())
				.customerStatus(entity.getCustomerStatus())
				.build();
	}
}
