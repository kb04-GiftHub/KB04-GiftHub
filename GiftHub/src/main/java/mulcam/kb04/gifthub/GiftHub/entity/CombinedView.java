package mulcam.kb04.gifthub.GiftHub.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Immutable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Immutable
public class CombinedView {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "productname")
    private String productname;

    @Column(name = "giftno")
    private Long giftno;

    @Column(name = "buyprice")
    private int buyprice;

    @Column(name = "useddate")
    private Date useddate;

    @Column(name = "storeId")
    private String storeId;

}
