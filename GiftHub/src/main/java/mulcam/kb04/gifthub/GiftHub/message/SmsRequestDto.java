package mulcam.kb04.gifthub.GiftHub.message;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SmsRequestDto {
	private String type;
	private String contentType;
	private String from;
	private String subject;
	private String content;
	private List<MessageDto> messages;
	private List<FileIdDto> files;
//	private String files;
}
