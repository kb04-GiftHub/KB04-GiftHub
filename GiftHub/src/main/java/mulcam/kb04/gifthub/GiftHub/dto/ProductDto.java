package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductDto {
	private int productNo, productPrice, status;
	private String productName, productMemo, productImage, storeId;
	private Date productExp;
	
	
	public static ProductDto entityToDto(Product entity) {
		
		return ProductDto.builder()
				.productNo(entity.getProductNo())
				.productPrice(entity.getProductPrice())
				.productName(entity.getProductName())
				.productMemo(entity.getProductMemo())
				.productImage(entity.getProductImage())
				.storeId(entity.getStoreId().getStoreId())
				.productExp(entity.getProductExp())
				.status(entity.getStatus())
				.build();
	}
	
	

}
