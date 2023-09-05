package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
	private int productNo, productPrice;
	private String productName, productMemo, productImage, storeId;
	private Date productExp;
	

}
