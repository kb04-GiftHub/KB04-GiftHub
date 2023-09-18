package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Jjim;
@Repository
public interface JjimRepository extends JpaRepository<Jjim, Integer> {

	@Query(value = "SELECT j.jjimNo, j.jjimStatus, p.productNo, p.productPrice, p.productName, p.productExp, p.productImage, s.storeName FROM Jjim j JOIN Product p ON (j.productNo = p.productNo) JOIN Store s ON(s.storeId = p.storeId) WHERE j.customerId = :customer AND j.jjimstatus = 1 ORDER BY p.productExp", nativeQuery = true)
	List<Object[]> findByCustomerIdToList(Customer customer);
	
}
