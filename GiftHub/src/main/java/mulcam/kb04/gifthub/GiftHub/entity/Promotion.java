package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Column;
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
@Table(name="PROMOTION")
public class Promotion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROMOTION_SEQ")
    @SequenceGenerator(sequenceName = "PROMOTION_SEQ", allocationSize = 1, name = "PROMOTION_SEQ")
	@Column(name="promotionNo")
	private int promotionNo;
	
	@Column(name="promotionTitle")
	private String promotionTitle;
	
	@Column(name="promotionContent")
	private String promotionContent;
	
	@Column(name="storeId")
	private String storeId;
	
	@Column(name="promotionDate")
	private Date promotionDate;
	
	@Column(name="promotionType")
	private int promotionType;

}