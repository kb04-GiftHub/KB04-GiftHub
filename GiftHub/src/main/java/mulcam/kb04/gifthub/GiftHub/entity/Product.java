package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.ProductDto;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PRODUCT_SEQ")
    @SequenceGenerator(sequenceName = "PRODUCT_SEQ", allocationSize = 1, name = "PRODUCT_SEQ")
	private int productNo;
	
	private int productPrice, status;
	private String productName, productMemo, productImage;
	private Date productExp;

	@ManyToOne
	@JoinColumn(name = "storeId")
	private Store storeId;

	public static Product dtoToEntity(ProductDto dto) {
		Store store = new Store();
		//Date date = new Date();
		
		store.setStoreId(dto.getStoreId());
		//date.setDate(dto.getProductExp());
		
		return Product.builder()
				.productNo(dto.getProductNo())
				.productPrice(dto.getProductPrice())
				.productName(dto.getProductName())
				.productMemo(dto.getProductMemo())
				.productImage(dto.getProductImage())
				.storeId(store)
				.productExp(dto.getProductExp())
				.status(dto.getStatus())
				.build();
	}
}
