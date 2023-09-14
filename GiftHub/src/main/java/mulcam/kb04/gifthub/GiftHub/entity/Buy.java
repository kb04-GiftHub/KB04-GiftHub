package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.BuyDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Buy {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BUY_SEQ")
	@SequenceGenerator(sequenceName = "BUY_SEQ", allocationSize = 1, name = "BUY_SEQ")
	private int buyNo;

	private int buyPrice;

	@ManyToOne
	@JoinColumn(name = "productNo")
	private Product productNo;

	private Date buyDate;
	
	@OneToOne
	@JoinColumn(name = "storeId")
	private Store storeId;

	@OneToOne
	@JoinColumn(name = "buyerId", referencedColumnName = "customerId")
	private Customer buyerId;
	
	public static Buy dtoToEntity(BuyDto dto) {
		
		
		Product product = new Product();
		product.setProductNo(dto.getProductNo());
		
		Store store = new Store();
		store.setStoreId(dto.getStoreId());
		
		Customer buyer = new Customer();
		buyer.setCustomerId(dto.getBuyerId());
		
		return Buy.builder()
				.buyNo(dto.getBuyNo())
				.buyPrice(dto.getBuyPrice())
				.productNo(product)
				.buyDate(dto.getBuyDate())
				.storeId(store)
				.buyerId(buyer)
				.build();
	}
	
}	
