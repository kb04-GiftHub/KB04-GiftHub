package mulcam.kb04.gifthub.GiftHub.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StoreDto {
	private String storeId, storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private Integer storeStatus, categoryNo, storePoint;

	public static StoreDto entityToDto(Store entity) {
		return StoreDto.builder()
				.storeId(entity.getStoreId())
				.storePwd(entity.getStorePwd())
				.storeName(entity.getStoreName())
				.storeEmail(entity.getStoreEmail())
				.storeTel(entity.getStoreTel())
				.storeAdd1(entity.getStoreAdd1())
				.storeAdd2(entity.getStoreAdd2())
				.storeAdd3(entity.getStoreAdd3())
				.storeStatus(entity.getStoreStatus())
				.categoryNo(entity.getCategoryNo().getCategoryNo())
				.storePoint(entity.getStorePoint())
				.build();
	}
}