package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Entity
@Table(name="BUY")
public class Buy {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BUY_SEQ")
    @SequenceGenerator(sequenceName = "BUY_SEQ", allocationSize = 1, name = "BUY_SEQ")
	@Column(name="buyNo")
	private int buyNo;
	
	@Column(name="buyPrice")
	private int buyPrice;
	
	@Column(name="productNo")
	private int productNo;
	
	@Column(name="buyDate")
	private Date buyDate;
	
	@Column(name="storeId")
	private String storeId;
	
	@Column(name="buyerId")
	private String buyerId;

	
}
