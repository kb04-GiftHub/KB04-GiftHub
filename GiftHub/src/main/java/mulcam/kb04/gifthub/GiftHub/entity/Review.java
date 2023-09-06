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
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REVIEW_SEQ")
    @SequenceGenerator(sequenceName = "REVIEW_SEQ", allocationSize = 1, name = "REVIEW_SEQ")
	private int reviewNo;
	
	private String reviewContent,reviewImage;
	private int reviewScore;
	private Date reviewDate;
	
	@ManyToOne
	@JoinColumn(name = "giftNo")
	private Gift gift;

}
