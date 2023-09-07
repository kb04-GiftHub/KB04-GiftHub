package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerDto {
	private String customerID,customerPwd, customerEmail,customerGender,customerBirth, customerName, customerTel, customerAdd1, customerAdd2, customerAdd3, customerNickname;
	private int point,customerStatus;

}
