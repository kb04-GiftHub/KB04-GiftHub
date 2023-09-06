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
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROMOTION_SEQ")
    @SequenceGenerator(sequenceName = "PROMOTION_SEQ", allocationSize = 1, name = "PROMOTION_SEQ")
	private int promotionNo;
	
	private String promotionTitle, promotionContent;
	private Date promotionDate;
	private int promotionType;
	
	@ManyToOne
	@JoinColumn(name = "storeId")
	private Store store;

}