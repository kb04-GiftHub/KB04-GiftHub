package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private String reviewNo, reviewContent, reviewImage;
	private int reviewScore, giftNo;
	private Date reviewDate;

}
