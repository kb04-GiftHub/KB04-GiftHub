package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	
	@Query(value = "SELECT p.PRODUCTNO, p.PRODUCTPRICE, p.PRODUCTNAME, "
			+ "p.PRODUCTMEMO, p.PRODUCTEXP, p.PRODUCTIMAGE, "
			+ "s.STORENAME, s.STOREADD2, s.CATEGORYNO "
			+ "FROM product p JOIN store s ON p.STOREID = s.STOREID;", nativeQuery = true)
	List<Object[]> findAllProductAndStore();
	
	
	@Query(value = "SELECT p.PRODUCTNO, p.PRODUCTPRICE, p.PRODUCTNAME, p.PRODUCTMEMO, p.PRODUCTEXP, p.PRODUCTIMAGE, p.STOREID, s.CATEGORYNO FROM PRODUCT p JOIN STORE s ON p.STOREID = s.STOREID", nativeQuery = true)
	List<Object[]> findAllProductAndCategory();
	
}
