package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="CATEGORY")
public class Category {
	@Id
	private int categoryNo;
	private String categoryName;
}
