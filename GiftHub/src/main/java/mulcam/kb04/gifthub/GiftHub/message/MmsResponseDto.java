package mulcam.kb04.gifthub.GiftHub.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MmsResponseDto {
	
	private String fileId;
	private String createTime;
	private String expireTime;
	
}
