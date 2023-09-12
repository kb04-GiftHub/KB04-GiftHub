package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;

@Repository
public interface GiftRepository extends JpaRepository<Gift, Integer> {

	@Query(value = "SELECT g.giftNo, g.giftExp, g.giftBarcode, g.giftStatus, g.customerId, b.buyDate, b.buyPrice, p.productPrice, p.productName, p.productMemo, p.productImage, s.storeName, s.storeTel FROM Gift g JOIN BUY b ON (b.buyNo = g.buyNo) JOIN Product p ON(p.productNo = b.productNo) JOIN Store s ON(s.storeId = p.storeId) WHERE g.customerId = :customer ORDER BY g.giftExp DESC", nativeQuery = true)
	List<Object[]> findByCustomerIdToList(Customer customer);
	
	List<Gift> findByCustomerId(Customer customer);
	
}
