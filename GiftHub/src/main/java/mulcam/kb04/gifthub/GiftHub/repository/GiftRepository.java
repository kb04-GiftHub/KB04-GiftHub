package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;

@Repository
public interface GiftRepository extends JpaRepository<Gift, Long> {

	@Query(value = "SELECT g.giftNo, g.giftExp, g.giftBarcode, g.giftStatus, g.customerId, b.buyDate, b.buyPrice, p.productPrice, p.productName, p.productMemo, p.productImage, s.storeName, s.storeTel FROM Gift g JOIN BUY b ON (b.buyNo = g.buyNo) JOIN Product p ON(p.productNo = b.productNo) JOIN Store s ON(s.storeId = p.storeId) WHERE g.customerId = :customer ORDER BY g.giftExp", nativeQuery = true)
	List<Object[]> findByCustomerIdToList(Customer customer);
	
	@Query(value = "SELECT g.giftNo, g.giftExp, g.giftBarcode, g.giftStatus, b.buyDate, b.buyPrice, p.productName, p.productMemo, p.productImage, s.storeName, s.storeTel, s.storeAdd2, s.storeAdd3 FROM Gift g JOIN BUY b ON (b.buyNo = g.buyNo) JOIN Product p ON(p.productNo = b.productNo) JOIN Store s ON(s.storeId = p.storeId) WHERE g.giftNo = :no", nativeQuery = true)
	Object findByGiftNo(long no);
	
	List<Gift> findByCustomerId(Customer customer);
	
	@Query(value = "SELECT giftNo, giftStatus, buyNo, giftBarcode, customerId, giftExp FROM GIFT WHERE giftNo = :no AND giftStatus = 1", nativeQuery=true)
	Gift getByGiftNo(long no);
}
