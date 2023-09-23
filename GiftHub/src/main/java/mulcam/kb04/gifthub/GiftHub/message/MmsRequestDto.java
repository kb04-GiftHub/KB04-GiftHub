package mulcam.kb04.gifthub.GiftHub.message;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class MmsRequestDto {
	
	private String fileName;
	private String fileBody;
	
}
