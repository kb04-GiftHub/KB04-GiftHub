package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {

	@Id
	private String storeId;

	private String storePwd, storeName, storeEmail, storeTel, storeAdd1, storeAdd2, storeAdd3;
	private int storeStatus;

	@ManyToOne
	@JoinColumn(name = "categoryNo")
	private Category categoryNo;

}