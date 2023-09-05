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

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewNo, String reviewContent, String reviewImage, int reviewScore, int giftNo,
			Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewImage = reviewImage;
		this.reviewScore = reviewScore;
		this.giftNo = giftNo;
		this.reviewDate = reviewDate;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public int getGiftNo() {
		return giftNo;
	}

	public void setGiftNo(int giftNo) {
		this.giftNo = giftNo;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewImage=" + reviewImage
				+ ", reviewScore=" + reviewScore + ", giftNo=" + giftNo + ", reviewDate=" + reviewDate + "]";
	}

}
