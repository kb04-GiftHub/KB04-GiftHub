package mulcam.kb04.gifthub.GiftHub.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {
	private String storeId, storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private int storeStatus, categoryNo;

}