package mulcam.kb04.gifthub.GiftHub.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Category {
	@Id
	private int categoryNo;
	
	private String categoryName;
}
