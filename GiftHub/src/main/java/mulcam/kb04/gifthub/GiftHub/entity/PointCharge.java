package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointCharge {
	
	@Id
	private String merchantUid;
	
	private String impUid;
	private int chargeAmount;
	private Date chargeDate;
	
	@ManyToOne
	@JoinColumn(name = "customerId")
	private Customer customer;

}