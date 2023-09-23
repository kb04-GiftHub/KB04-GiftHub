package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Customer;
import mulcam.kb04.gifthub.GiftHub.entity.Jjim;
import mulcam.kb04.gifthub.GiftHub.entity.Product;
@Repository
public interface JjimRepository extends JpaRepository<Jjim, Integer> {

	@Query(value = "SELECT j.jjimNo, j.jjimStatus, p.productNo, p.productPrice, p.productName, p.productExp, p.productImage, s.storeName FROM Jjim j JOIN Product p ON (j.productNo = p.productNo) JOIN Store s ON(s.storeId = p.storeId) WHERE j.customerId = :customer AND j.jjimstatus = 1 ORDER BY p.productExp", nativeQuery = true)
	List<Object[]> findByCustomerIdToList(Customer customer);
	
	@Query(value = "SELECT COUNT(jjimNo) FROM JJIM WHERE productNo = :product and customerId = :customer", nativeQuery=true)
	long count(Product product, Customer customer);
	
	@Query(value = "SELECT jjimNo, productNo, customerId, jjimStatus from Jjim where productNo = :product and customerId = :customer", nativeQuery=true)
	Jjim findByProductNoAndCustomerId(Product product, Customer customer);
	
	Jjim findByJjimNo(int jjimNo);
	
	@Query(value = "SELECT jjimNo, jjimStatus, productNo, customerId FROM JJIM WHERE customerId = :customerId",nativeQuery=true)
	List<Jjim> findByCustomer(String customerId);
}
