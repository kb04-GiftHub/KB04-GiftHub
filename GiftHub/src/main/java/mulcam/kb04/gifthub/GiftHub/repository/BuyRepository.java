package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Buy;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface BuyRepository extends JpaRepository<Buy, Integer> {
	@Query("SELECT FUNCTION('MONTH', b.buyDate) as month, COUNT(b) as count FROM Buy b WHERE b.storeId = :storeId GROUP BY FUNCTION('MONTH', b.buyDate)")
	List<Object[]> countByMonth(@Param("storeId") Store storeId);

	@Query("SELECT p.productname, g.giftno, b.buyprice, b.buydate FROM product p JOIN buy b ON p.productno = b.productno JOIN gift g ON b.buyno = g.buyno WHERE p.storeId = :storeId")
	List<Object[]> findStoreDetailsByStoreId(@Param("storeId") String storeId);

}
