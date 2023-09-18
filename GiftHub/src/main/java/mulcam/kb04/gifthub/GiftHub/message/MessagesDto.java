package mulcam.kb04.gifthub.GiftHub.message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessagesDto {
	
	private String requestId, campaingId, messageId, requestTime, contentType, type, countryCode, from, to, completeTime, telcoCode, status,statusCode,statusName, statusMessage;
}
