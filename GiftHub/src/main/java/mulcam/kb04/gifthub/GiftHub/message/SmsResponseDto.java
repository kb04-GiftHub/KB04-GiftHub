package mulcam.kb04.gifthub.GiftHub.message;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SmsResponseDto {
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;
	private String statusName;
	
}
