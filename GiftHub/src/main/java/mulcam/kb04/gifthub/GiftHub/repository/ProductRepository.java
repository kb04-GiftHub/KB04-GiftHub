package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Product;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	@Query(value = "SELECT p.PRODUCTNO, p.PRODUCTPRICE, p.PRODUCTNAME, "
			+ "p.PRODUCTMEMO, p.PRODUCTEXP, p.PRODUCTIMAGE, "
			+ "s.STORENAME, s.STOREADD2, s.CATEGORYNO "
			+ "FROM Product p JOIN store s ON p.STOREID = s.STOREID;", nativeQuery = true)
	List<Object[]> findAllProductAndStore();
	
	
	@Query(value = "SELECT p.PRODUCTNO, p.PRODUCTPRICE, p.PRODUCTNAME, p.PRODUCTMEMO, p.PRODUCTEXP, p.PRODUCTIMAGE, p.STOREID, s.CATEGORYNO, s.STORENAME FROM PRODUCT p JOIN STORE s ON p.STOREID = s.STOREID WHERE p.PRODUCTEXP >= SYSDATE AND p.status = 0", nativeQuery = true)
	List<Object[]> findAllProductAndCategory();


	Product findByProductNo(int productNo);
	
	List<Product> findByStoreId(Store store);
	
}
