package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDto {
	private String storeId, storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private int storeStatus, categoryNo;
}