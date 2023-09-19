package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.Category;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, String> {

	Store findByStoreId(String id);

	int countByStoreId(String id);

	List<Store> findAll();
	
	@Query(value = "SELECT * FROM STORE WHERE storeName LIKE '%' || ?1 || '%'",nativeQuery=true)
	List<Store> findByStoreName(String storeName);
	
//	@Query(value="SELECT storeId, storePwd, storeName, storeEmail, storeAdd1, storeAdd2, storeAdd3, storeStatus, storePoint, categoryNo FROM STORE WHERE categoryNo = :cat", nativeQuery=true)
//	List<Store> findAllByCategoryNo(Category cat);

}
