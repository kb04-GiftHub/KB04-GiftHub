package mulcam.kb04.gifthub.GiftHub.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {
	private int reviewNo;
	private String reviewContent,reviewImage;
	private int reviewScore, giftNo;
	private Date reviewDate;

}
