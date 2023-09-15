package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Jjim;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JjimDto {
	private int jjimNo, productNo;
	private String customerId;
	private int jjimStatus;
	
	public static JjimDto entityToDto(Jjim entity) {
		return JjimDto.builder()
				.jjimNo(entity.getJjimNo())
				.productNo(entity.getProductNo().getProductNo())
				.customerId(entity.getCustomerId().getCustomerId())
				.jjimStatus(entity.getJjimStatus())
				.build();
	}
}
