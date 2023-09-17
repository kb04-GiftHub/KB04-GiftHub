package mulcam.kb04.gifthub.GiftHub.message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SmsResultDto {
	
	private String statusCode,statusName;
	private MessagesDto messages;
	private Integer pageIndex, pageSize, itemCount;
	private boolean hasMore;
	
}
