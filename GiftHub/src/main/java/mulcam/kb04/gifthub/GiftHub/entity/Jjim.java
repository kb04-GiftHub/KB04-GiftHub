package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name="JJIM", uniqueConstraints = {
	@UniqueConstraint(columnNames = {"productNo","customerId"})	
})
public class Jjim {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "JJIM_SEQ")
	@SequenceGenerator(sequenceName = "JJIM_SEQ", allocationSize = 1, name = "JJIM_SEQ")
	private int jjimNo;

	@ManyToOne
	@JoinColumn(name = "productNo")
	private Product productNo;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customerId;
	
	private int jjimStatus;
	
	public static Jjim dtoToEntity(JjimDto dto) {
		Product product = new Product();
		product.setProductNo(dto.getProductNo());
		
		Customer customer = new Customer();
		customer.setCustomerId(dto.getCustomerId());

		return Jjim.builder()
				.jjimNo(dto.getJjimNo())
				.productNo(product)
				.customerId(customer)
				.jjimStatus(dto.getJjimStatus())
				.build();
	}
}
