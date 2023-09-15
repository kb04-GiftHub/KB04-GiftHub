package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Store {

	@Id
	private String storeId;

	private String storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private Integer storeStatus, storePoint;

	@ManyToOne
	@JoinColumn(name = "categoryNo")
	private Category categoryNo;

	public static Store dtoToEntity(StoreDto dto) {
		Category category = new Category();
		category.setCategoryNo(dto.getCategoryNo());

		return Store.builder()
				.storeId(dto.getStoreId())
				.storePwd(dto.getStorePwd())
				.storeName(dto.getStoreName())
				.storeEmail(dto.getStoreEmail())
				.storeTel(dto.getStoreTel())
				.storeAdd1(dto.getStoreAdd1())
				.storeAdd2(dto.getStoreAdd2())
				.storeAdd3(dto.getStoreAdd3())
				.storeStatus(dto.getStoreStatus())
				.categoryNo(category)
				.storePoint(dto.getStorePoint())
				.build();
	}
}