package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.GiftUsed;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface GiftUsedRepository extends JpaRepository<GiftUsed, Integer> {
	@Query("SELECT FUNCTION('MONTH', g.usedDate) as month, COUNT(g) as count FROM GiftUsed g GROUP BY FUNCTION('MONTH', g.usedDate)")
	List<Object[]> countByMonth();

	/* JOIN Store s ON (b.storeId = s.storeId) */
	@Query(value = "SELECT gu.usedNo, gu.usedDate, gu.giftNo, gu.customerId, "
			+ "p.productName  FROM GiftUsed gu JOIN Gift g ON (gu.giftNo = g.giftNo) JOIN BUY b ON (b.buyNo = g.buyNo) JOIN Product p ON(p.productNo = b.productNo) "
			+ "WHERE p.storeId = :storeId ORDER BY gu.usedDate DESC" , nativeQuery = true)
	List<Object[]> findByStoreId(Store storeId);
	
	@Query(value="SELECT count(gu.usedNo) from giftUsed gu JOIN Gift g ON(gu.giftNo = g.giftNo) JOIN BUY b ON (b.buyNo = g.buyNo) where b.storeId = :storeId", nativeQuery=true)
	int countByStoreId(String storeId);
	
}
